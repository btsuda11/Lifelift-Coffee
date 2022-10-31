import './ProductIndex.css';
import { useDispatch, useSelector } from 'react-redux';
import ProductIndexItem from './ProductIndexItem';
import { getProducts, fetchProducts } from '../../../actions/productActions';
import { useEffect } from 'react';

const ProductIndex = () => {
    const dispatch = useDispatch();
    const products = useSelector(getProducts);

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
        </>
    )
}

export default ProductIndex;