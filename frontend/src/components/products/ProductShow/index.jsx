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
                    <button>Buy One Time</button>
                    <div>
                        {product.map(type => (
                            <>
                                <button className='product-type-btn'>{type.productType}</button>
                                <div>
                                    <button className='product-price-btn'>
                                        <p className='bold'>1</p>
                                        <p className='bold'>${type.price}</p>
                                        <p className='strike-out'>${(1.25 * type.price).toFixed(2)}</p>
                                    </button>
                                    <button className='product-price-btn'>
                                        <p className='bold'>3</p>
                                        <p className='bold'>${(0.89 * type.price).toFixed(2)}</p>
                                        <p>Per Bag</p>
                                    </button>
                                    <button className='product-price-btn'>
                                        <p className='bold'>5</p>
                                        <p className='bold'>${(0.82 * type.price).toFixed(2)}</p>
                                        <p>Per Bag</p>
                                    </button>
                                </div>
                            </>
                        ))}
                    </div>
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