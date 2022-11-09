import './SpotlightSection.css';
import { useDispatch, useSelector } from 'react-redux';
import { fetchFeaturedProduct, getProduct, removeProducts } from '../../../../actions/productActions';
import ProductInfo from '../../../products/ProductShow/ProductInfo';
import { useEffect, useState } from 'react';
import { camelize } from '../../../products/ProductShow';

const SpotlightSection = ({ setShowCart }) => {
    const dispatch = useDispatch();
    const [spotlightItem, setSpotlightItem] = useState('medium-roast');
    const [spotlightStyle, setSpotlightStyle] = useState({'medium-roast': { borderBottom: '2px solid black' }, 'light-roast': {}, 'dark-roast': {}, 'medium-roast-decaf': {}})
    const product = useSelector(getProduct(camelize(spotlightItem)));

    useEffect(() => {
        dispatch(fetchFeaturedProduct('medium-roast'));
        dispatch(fetchFeaturedProduct('light-roast'));
        dispatch(fetchFeaturedProduct('dark-roast'));
        dispatch(fetchFeaturedProduct('medium-roast-decaf'));
        return () => dispatch(removeProducts());
    }, [dispatch]);

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
            <ProductInfo product={product} spotlight={true} setShowCart={setShowCart} />
        </section>
    )
}

export default SpotlightSection;