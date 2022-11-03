import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchCartItems, getCartItems } from '../../../actions/cartItemActions';
import CartItem from './CartItem';
import './CartSideBar.css';
import { AiOutlineRight } from 'react-icons/ai';

const CartSideBar = ({ setShowCart }) => {
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
                {cartItems.map( (item) => <CartItem item={item} /> )}
            </div>
            <div className='cart-footer'>

            </div>
        </div>
    )
}

export default CartSideBar;