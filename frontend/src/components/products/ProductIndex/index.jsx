import './ProductIndex.css';
import { useDispatch, useSelector } from 'react-redux';
import ProductIndexItem from './ProductIndexItem';
import { getProducts, fetchProducts, removeProducts } from '../../../actions/productActions';
import { useEffect } from 'react';
import { useParams } from 'react-router-dom';

const ProductIndex = ({ closeCart }) => {
    const dispatch = useDispatch();
    const products = useSelector(getProducts);
    
    let { category } = useParams();
    
    const capitalizeWords = str => {
        const words = str.split('-');
        const capitalizedWords = words.map((word) => (
            word[0].toUpperCase() + word.slice(1).toLowerCase()
            ))
            return capitalizedWords.join(' ');
        }
    
    category ? category = capitalizeWords(category) : category = 'All Products';

    useEffect(() => {
        dispatch(fetchProducts(category));
        return () => dispatch(removeProducts());
    }, [dispatch, category])

    if (products[0] instanceof Array) return null;

    return (
        <>
            <section className='shop-lifelift-section' onClick={closeCart}>
                <div>
                    <h1>Shop Lifelift</h1>
                    <p className='spaced'>Using Sustainable Farming & Protecting Our Wildlife</p>
                </div>
            </section>
            <section className='products-section' onClick={closeCart}>
                <div>
                    <h2 className='category-title'>{category}</h2>
                </div>
                <div className='product-grid'>
                    {products.map(product => (<ProductIndexItem key={product.id} product={product} search={false}/>))}
                </div>
            </section>
        </>
    )
}

export default ProductIndex;