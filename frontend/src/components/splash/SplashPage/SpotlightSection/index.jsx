import './SpotlightSection.css';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProduct, getProduct } from '../../../../actions/productActions';
import ProductInfo from '../../../products/ProductShow/ProductInfo';
import { useEffect, useState } from 'react';
import { camelize } from '../../../products/ProductShow';

const SpotlightSection = () => {
    const dispatch = useDispatch();
    const [spotlightItem, setSpotlightItem] = useState('medium-roast');
    const [spotlightStyle, setSpotlightStyle] = useState({'medium-roast': { borderBottom: '2px solid black' }, 'light-roast': {}, 'dark-roast': {}, 'medium-roast-decaf': {}})
    const product = useSelector(getProduct(camelize(spotlightItem)));

    useEffect(() => {
        dispatch(fetchProduct(spotlightItem));
    }, [dispatch, spotlightItem]);

    const handleClick = productName => {
        const style = {'medium-roast': {}, 'light-roast': {}, 'dark-roast': {}, 'medium-roast-decaf': {}}
        setSpotlightItem(productName);
        setSpotlightStyle({...style, [productName]: { borderBottom: '2px solid black' }})
    }

    if (product === undefined || product.length === 0 || !Array.isArray(product)) return null;

    return (
        <section className='spotlight-section'>
            <div className='spotlight-btn-div'>
                <button style={spotlightStyle['medium-roast']} onClick={() => handleClick('medium-roast')} >
                    <p>Medium Roast</p>
                </button>
                <button style={spotlightStyle['light-roast']} onClick={() => handleClick('light-roast')}>
                    <p>Light Roast</p>
                </button>
                <button style={spotlightStyle['dark-roast']} onClick={() => handleClick('dark-roast')}>
                    <p>Dark Roast</p>
                </button>
                <button style={spotlightStyle['medium-roast-decaf']} onClick={() => handleClick('medium-roast-decaf')}>
                    <p>Medium Roast Decaf</p>
                </button>
            </div>
            <ProductInfo product={product} spotlight={true} />
        </section>
    )
}

export default SpotlightSection;