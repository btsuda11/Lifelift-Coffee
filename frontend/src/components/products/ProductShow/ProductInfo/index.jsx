import { useState } from 'react';
import './ProductInfo.css';
import productImg from '../../../../images/ProductIndex/medium-roast.jpeg';

const ProductInfo = ({ product, spotlight }) => {
    const [clickQuantity, setClickQuantity] = useState({ '1': true, '3': false, '6': false });
    const [quantityStyle, setQuantityStyle] = useState({ '1': {backgroundColor: '#e5e7eb'}, '3': {}, '6': {} });
    const [clickType, setClickType] = useState({'Ground': true, 'Whole Beans': false, 'Go Bags': false});
    const [typeStyle, setTypeStyle] = useState({'Ground': {backgroundColor: '#e5e7eb'}, 'Whole Beans': {}, 'Go Bags': {}});

    const productTypes = [...new Set(product.map(option => option.productType))];

    const handleQuantity = quantity => {
        const quant = { '1': false, '3': false, '6': false };
        const quantStyle = {'1': {}, '3': {}, '6': {}};
        setClickQuantity({ ...quant, [quantity]: true });
        setQuantityStyle({ ...quantStyle, [quantity]: {backgroundColor: '#e5e7eb'} });
    }

    const handleType = type => {
        const typ = { 'Ground': false, 'Whole Beans': false, 'Go Bags': false };
        const typStyle = { 'Ground': {}, 'Whole Beans': {}, 'Go Bags': {} }
        setClickType({ ...typ, [type]: true });
        setTypeStyle({ ...typStyle, [type]: {backgroundColor: '#e5e7eb'} });
    }

    return (
        <section className='product-info-section'>
            <div className='product-imgs'>
                <img src={productImg} />
            </div>
            <div className='product-info-div'>
                <h2>{product[0].name}</h2>
                {spotlight && 
                    <p>The healthiest, tastiest {product[0].name.toLowerCase()} coffee possible. Enjoy our low-acid {product[0].name.toLowerCase()} coffee.</p>
                }
                <button className='product-toggle-btn bold'>Buy One Time</button>
                <div>
                    <div className='product-type-div'>
                        {productTypes.map(type => {
                            if (type) return <button onClick={() => handleType(type)} style={typeStyle[type]} className='product-type-btn'>{type}</button>
                        })}
                    </div>
                    <div className='price-btn-div'>
                        {product.map(option => {
                            return (
                                <>
                                    {(clickType[option.productType] === true || !option.productType) &&
                                        <button onClick={() => handleQuantity(option.amount)} className='product-price-btn' style={quantityStyle[option.amount]}>
                                            <p className='bold'>{option.amount}</p>
                                            <p className='bold'>${(option.price / option.amount).toFixed(2)}</p>
                                            {option.amount === 1 ? <p className='strike-out'>${(1.25 * option.price).toFixed(2)}</p> : null }
                                            {option.category === 'Coffee Pods' && option.amount !== 1 ? <p>Per Box</p> : null}
                                            {option.category === 'Health Boosters' && option.amount !== 1 ? <p>Per Unit</p> : null}
                                            {(option.category === 'Light Medium Dark Roasts' || option.category === 'Decaf Coffee' || option.category === 'Flavored Coffee') && option.amount !== 1 ? <p>Per Bag</p> : null}
                                        </button>
                                    }
                                </>
                            )
                        })} 
                    </div>
                </div>
                <button className='red-btn'>Add to Cart</button>
            </div>
        </section>
    )
}

export default ProductInfo;