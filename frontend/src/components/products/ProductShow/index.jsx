import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchProduct, getProduct } from '../../../actions/productActions';
import './ProductShow.css';

const ProductShow = () => {
    const dispatch = useDispatch();
    const { productId } = useParams();
    const product = useSelector(getProduct(productId));

    useEffect(() => {
        dispatch(fetchProduct(productId));
    }, [dispatch, productId])

    return (
        <>
            <h1>{product.name}</h1>
        </>
    )
}

export default ProductShow;