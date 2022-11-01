import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchProduct, getProduct } from '../../../actions/productActions';
import productImg from '../../../images/ProductIndex/medium-roast.jpeg';
import './ProductShow.css';

const ProductShow = () => {
    const dispatch = useDispatch();
    const { productName } = useParams();
    
    const product = useSelector(getProduct(camelize(productName)));
    
    useEffect(() => {
        dispatch(fetchProduct(productName));
    }, [dispatch, productName])
    
    if (!Array.isArray(product) || product.length === 0) return null;

    return (
        <>
            <section className='product-info-section'>
                <div className='product-imgs'>
                    <img src={productImg} />
                </div>
                <div className='product-info-div'>
                    <h2>{product[0].name}</h2>
                </div>
            </section>
        </>
    )
}

export default ProductShow;

export const camelize = name => {
    const newName = name.split('-').map((word, i) => {
        if (i !== 0) {
            return word[0].toUpperCase() + word.slice(1).toLowerCase();
        } else {
            return word;
        }
    })
    return newName.join('');
}