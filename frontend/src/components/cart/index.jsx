import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchCartItems, getCartItems } from '../../actions/cartItemActions';
import CartItem from './CartItem';
import './CartSideBar.css';
import { AiOutlineRight } from 'react-icons/ai';

const CartSideBar = ({ setShowCart, cartTotal, setCartTotal }) => {
    const dispatch = useDispatch();
    const cartItems = useSelector(getCartItems);

    useEffect(() => {
        dispatch(fetchCartItems());
    }, [dispatch])

    return (
        <div className='cart'>
            <div className='cart-header'>
                <div>
                    <h3>Your Cart</h3>
                    <AiOutlineRight style={{cursor: 'pointer'}} onClick={() => setShowCart(false)} />
                </div>
            </div>
            <div className='cart-items'>
                {cartItems.map( (item) => <CartItem item={item} cartTotal={cartTotal} setCartTotal={setCartTotal} /> )}
            </div>
            <div className='cart-footer'>
                <div>
                    <p>Subtotal</p>
                    <p>${cartTotal.toFixed(2)}</p>
                </div>
                <div>
                    <p>Shipping</p>
                    <p>Calculated at Checkout</p>
                </div>
                <div>
                    <h5>Grand Total</h5>
                    <h5>${cartTotal.toFixed(2)}</h5>
                </div>
                <button className=''>Continue Checkout</button>
            </div>
        </div>
    )
}

export default CartSideBar;