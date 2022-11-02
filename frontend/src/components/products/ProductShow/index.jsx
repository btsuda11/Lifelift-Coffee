import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchProduct, getProduct } from '../../../actions/productActions';
import ProductInfo from './ProductInfo';
import healthiestCoffee from '../../../images/ProductShow/healthiest-coffee-section.jpeg';
import clean from '../../../images/ProductShow/clean.svg';
import cause from '../../../images/ProductShow/cause.svg';
import connection from '../../../images/ProductShow/connection.svg';
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
            <section className='highlights-section'>
                <div className='highlights-description'>
                    <div>
                        <h2>Highlights</h2>
                        {product[0].category !== 'Coffee Pods' ? 
                            <p className='spaced'>{product[0].description}</p> : 
                            <ul className='highlights-list spaced'>
                                {product[0].description.split('.').map(li => <li>{li}</li>)}
                            </ul>}
                    </div>
                </div>
                <div className='highlights-img' />
            </section>
            <section className='healthiest-section'>
                <div className='reasons-div'>
                    <h1>The Healthiest, Tastiest Coffee Possible</h1>
                    <div>
                        <div className='reasons spaced'>
                            <img src={clean}/>
                            <p><span className='bold'>CLEAN</span> - 80% of the time, put clean foods AND clean beverages in your body such as Lifelift coffee. The other 20% of the time, enjoy life and treat yourself!</p>
                        </div>
                        <div className='reasons spaced'>
                            <img src={cause} />
                            <p><span className='bold'>CAUSE</span> - Support something you believe in. We support the farmers, their families and communities. We also definitely support sustainable farming methods, wildlife protection, and our first responders.</p>
                        </div>
                        <div className='reasons spaced'>
                            <img src={connection} />
                            <p><span className='bold'>CONNECTION</span> - Coffee connects us. Whether it's conversations with friends or family, business meetings or simply just spending time with yourself. Life is about connection.</p>
                        </div>
                    </div>
                </div>
                <div className='healthiest-img-div'>
                    <img src={healthiestCoffee}/>
                </div>
            </section>
        </>
    )
}

export default ProductShow;

export const camelize = name => {
    if (name === 'hpadapt-adrenal-drink') return 'hPAdaptAdrenalDrink';
    const newName = name.split('-').map((word, i) => {
        if (i !== 0) {
            return word[0].toUpperCase() + word.slice(1).toLowerCase();
        } else {
            return word;
        }
    })
    return newName.join('');
}