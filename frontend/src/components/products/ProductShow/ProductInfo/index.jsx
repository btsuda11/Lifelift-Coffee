import { useState } from 'react';
import './ProductInfo.css';
import productImg from '../../../../images/ProductIndex/medium-roast.jpeg';

const ProductInfo = ({ product }) => {
    const [clickQuantity, setClickQuantity] = useState({ '1': true, '3': false, '6': false });
    const [quantityStyle, setQuantityStyle] = useState({ '1': {backgroundColor: '#e5e7eb'}, '3': {}, '6': {} });
    const [clickType, setClickType] = useState({'Ground': true, 'Whole Beans': false, 'Go Bags': false});
    const [typeStyle, setTypeStyle] = useState({'Ground': {backgroundColor: '#e5e7eb'}, 'Whole Beans': {}, 'Go Bags': {}});
    
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
                <button className='product-toggle-btn bold'>Buy One Time</button>
                <div>
                    <div className='product-type-div'>
                        {product.map(type => {
                            if (type.productType) return <button onClick={() => handleType(type.productType)} style={typeStyle[type.productType]} className='product-type-btn'>{type.productType}</button>
                        })}
                    </div>
                    {product.map(type => {
                        return (
                            <>
                                { (clickType[type.productType] === true || !type.productType) &&
                                    <div className='price-btn-div'>
                                        <button onClick={() => handleQuantity('1')} className='product-price-btn' style={quantityStyle['1']}>
                                            <p className='bold'>1</p>
                                            <p className='bold'>${type.price}</p>
                                            <p className='strike-out'>${(1.25 * type.price).toFixed(2)}</p>
                                        </button>
                                        <button onClick={() => handleQuantity('3')} className='product-price-btn' style={quantityStyle['3']}>
                                            <p className='bold'>3</p>
                                            <p className='bold'>${(0.89 * type.price).toFixed(2)}</p>
                                            <p>Per Bag</p>
                                        </button>
                                        <button onClick={() => handleQuantity('6')} className='product-price-btn' style={quantityStyle['6']}>
                                            <p className='bold'>6</p>
                                            <p className='bold'>${(0.82 * type.price).toFixed(2)}</p>
                                            <p>Per Bag</p>
                                        </button>
                                    </div>
                                }
                            </>
                        )
                    })}
                </div>
                <button className='red-btn'>Add to Cart</button>
            </div>
        </section>
    )
}

export default ProductInfo;