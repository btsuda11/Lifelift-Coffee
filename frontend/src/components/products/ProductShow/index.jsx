import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchProduct, getProduct } from '../../../actions/productActions';
import './ProductShow.css';

const ProductShow = () => {
    const dispatch = useDispatch();
    const { productName } = useParams();
    const product = useSelector(getProduct(camelize(productName)));

    useEffect(() => {
        dispatch(fetchProduct(productName));
    }, [dispatch, productName])

    return (
        <>
            <h1>{productName}</h1>
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