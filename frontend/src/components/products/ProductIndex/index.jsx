import './ProductIndex.css';
import { useDispatch, useSelector } from 'react-redux';
import ProductIndexItem from './ProductIndexItem';
import { getProducts, fetchProducts } from '../../../actions/productActions';
import { useEffect } from 'react';
import { useParams } from 'react-router-dom';

const ProductIndex = () => {
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
        dispatch(fetchProducts());
    }, [dispatch])

    return (
        <>
            <section className='shop-lifelift-section'>
                <div>
                    <h1>Shop Lifelift</h1>
                    <p className='spaced'>Using Sustainable Farming & Protecting Our Wildlife</p>
                </div>
            </section>
            <section className='products-section'>
                <div>
                    <h2>{category}</h2>
                </div>
                <div>

                </div>
            </section>
        </>
    )
}

export default ProductIndex;