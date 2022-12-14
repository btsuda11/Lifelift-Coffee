import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { createCartItem, getCartItems, updateCartItem } from '../../../../actions/cartItemActions';
import { getReviews } from '../../../../actions/reviewActions';
import './ProductInfo.css';
import productImg from '../../../../assets/ProductIndex/medium-roast.jpeg';
import { avgStarRating, avgRating } from '../../../reviews/ReviewIndex';
import { HiCheckCircle } from 'react-icons/hi';
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/navigation";
import { Navigation } from "swiper";

const ProductInfo = ({ product, spotlight, setShowCart, reviewsRef }) => {
    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);
    const cartItems = useSelector(getCartItems);
    const reviews = useSelector(getReviews);

    const [clickQuantity, setClickQuantity] = useState({ '1': true, '3': false, '6': false });
    const [quantityStyle, setQuantityStyle] = useState({ '1': {backgroundColor: '#e5e7eb'}, '3': {}, '6': {} });
    const [clickType, setClickType] = useState({'Ground': true, 'Whole Beans': false, 'Go Bags': false});
    const [typeStyle, setTypeStyle] = useState({'Ground': {backgroundColor: '#e5e7eb'}, 'Whole Beans': {}, 'Go Bags': {}});

    const productTypes = [...new Set(product.map(option => option.productType))];

    const handleQuantity = quantity => {
        const quant = { 1: false, 3: false, 6: false };
        const quantStyle = { 1: {}, 3: {}, 6: {} };
        setClickQuantity({ ...quant, [quantity]: true });
        setQuantityStyle({ ...quantStyle, [quantity]: {backgroundColor: '#e5e7eb'} });
    }

    const handleType = type => {
        const typ = { 'Ground': false, 'Whole Beans': false, 'Go Bags': false };
        const typStyle = { 'Ground': {}, 'Whole Beans': {}, 'Go Bags': {} }
        setClickType({ ...typ, [type]: true });
        setTypeStyle({ ...typStyle, [type]: {backgroundColor: '#e5e7eb'} });
    }

    const addToCart = () => {
        const item = clickedOption(product, clickType, clickQuantity);
        const existingItem = cartItems.find(({ productId }) => productId === item.id);
        setShowCart(true);
        if(cartItems.some(({ productId }) => productId === item.id)) {
            dispatch(updateCartItem({ ...existingItem, quantity: existingItem.quantity + 1 }));
        } else {
            dispatch(createCartItem({ quantity: 1, shopper_id: currentUserId, product_id: item.id }))
        }
    }

    return (
        <section className='product-info-section'>
            <div className='product-imgs'>
                <Swiper slidesPerView={1}
                    spaceBetween={30}
                    loop={true}
                    navigation={true}
                    modules={[Navigation]}
                    className="mySwiper">
                    <SwiperSlide><img src={product[0].photoUrls[0]} /></SwiperSlide>
                </Swiper>
                {/* <img src={productImg} /> */}
                {/* <img src={product[0].photoUrls[0]}/> */}
            </div>
            <div className='product-info-div'>
                <h2 style={spotlight ? {textAlign: 'center'} : {}}>{product[0].name}</h2>
                {!spotlight && 
                    <div onClick={() => reviewsRef.current?.scrollIntoView({ behavior: 'smooth' })}>
                        {avgStarRating(avgRating(reviews))}
                        <div className='number-reviews-div'>
                            <p>{reviews.length > 1 || reviews.length === 0 ? `${reviews.length} reviews` : `${reviews.length} review`}</p>
                        </div>
                    </div>
                }
                {spotlight && 
                    <>
                        <h3 style={{textAlign: 'center', marginBottom: '10px'}}>${clickedOption(product, clickType, clickQuantity).price.toFixed(2)}</h3>
                        <p style={{textAlign: 'center'}}>The healthiest, tastiest {product[0].name.toLowerCase()} coffee possible. Enjoy our low-acid {product[0].name.toLowerCase()} coffee.</p>
                    </>
                }
                <button className='product-toggle-btn bold'>Buy One Time</button>
                <div>
                    <div className='product-type-div'>
                        {productTypes.map(type => {
                            if (type) {
                                return (
                                    <div>
                                        <button key={type.id} onClick={() => handleType(type)} style={typeStyle[type]} className='product-type-btn'>{type}</button>
                                        <HiCheckCircle className='checkmark' style={clickType[type] === true ? { display: 'flex' } : {}} />
                                    </div>
                                )
                            }
                        })}
                    </div>
                    <div className='price-btn-div'>
                        {product.map(option => {
                            return (
                                <>
                                    {(clickType[option.productType] === true || !option.productType) &&
                                        <div>
                                            <button key={option.id} onClick={() => handleQuantity(option.amount)} className='product-price-btn' style={quantityStyle[option.amount]}>
                                                <p className='bold'>{option.amount}</p>
                                                <p className='bold'>${(option.price / option.amount).toFixed(2)}</p>
                                                {option.amount === 1 ? <p className='strike-out'>${(1.25 * option.price).toFixed(2)}</p> : null }
                                                {option.category === 'Coffee Pods' && option.amount !== 1 ? <p>Per Box</p> : null}
                                                {option.category === 'Health Boosters' && option.amount !== 1 ? <p>Per Unit</p> : null}
                                                {(option.category === 'Light Medium Dark Roasts' || option.category === 'Decaf Coffee' || option.category === 'Flavored Coffee') && option.amount !== 1 ? <p>Per Bag</p> : null}
                                            </button>
                                            <HiCheckCircle className='checkmark' style={clickQuantity[option.amount] === true ? {display: 'flex'} : {}}/>
                                        </div>
                                    }
                                </>
                            )
                        })} 
                    </div>
                </div>
                <button className='red-btn' onClick={addToCart}>Add to Cart</button>
            </div>
        </section>
    )
}

export default ProductInfo;

export const clickedButton = obj => {
    const keys = Object.keys(obj);
    return keys.filter(key => obj[key] === true)[0]
}

export const clickedOption = (product, type, quantity) => {
    const foundOption = product.find(({ productType, amount }) => {
        if (productType) {
            return productType === clickedButton(type) && amount == clickedButton(quantity)
        } else {
            return amount == clickedButton(quantity)
        }
    })
    if (!foundOption) {
        return product.find(({ productType, amount }) => {
            if (productType) {
                return productType === 'Ground' && amount == 1;
            } else {
                return amount == 1;
            }
        })
    } else {
        return foundOption;
    }
}