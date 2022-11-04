import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchCartItems, getCartItems } from '../../actions/cartItemActions';
import CartItem from './CartItem';
import './CartSideBar.css';
import { AiOutlineRight } from 'react-icons/ai';

const CartSideBar = ({ showCart, setShowCart, cartTotal, setCartTotal }) => {
    const dispatch = useDispatch();
    const [errors, setErrors] = useState([]);
    const cartItems = useSelector(getCartItems);
    const currentUserId = useSelector(state => state.session.currentUser)
    setCartTotal(cartItems.reduce((acc, a) => {
        if (a.shopperId === currentUserId) {
            return acc + (a.price * a.quantity);
        } else {
            return acc;
        }
    }, 0))

    useEffect(() => {
        setErrors([]);
        dispatch(fetchCartItems()).catch(async (res) => {
                let data;
                try {
                    // .clone() essentially allows you to read the response body twice
                    data = await res.clone().json();
                } catch {
                    data = await res.text(); // Will hit this case if the server is down
                }
                if (data?.message) setErrors(['Must be logged in to view cart']);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
        });
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
                { errors.length > 0 &&
                    <ul className='errors'>
                        {errors.map(error => <li key={error}>{error}</li>)}
                    </ul>}
                {cartItems.map( (item) => {
                    if (currentUserId === item.shopperId) return <CartItem item={item} cartTotal={cartTotal} />
                } )}
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