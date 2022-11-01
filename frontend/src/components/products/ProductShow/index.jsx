import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchProduct, getProduct } from '../../../actions/productActions';
import ProductInfo from './ProductInfo';
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
            <ProductInfo product={product} />
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