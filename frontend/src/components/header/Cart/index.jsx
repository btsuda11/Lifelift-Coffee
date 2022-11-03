import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchCartItems, getCartItems } from '../../../actions/cartItemActions';
import CartItem from './CartItem';
import './CartSideBar.css';

const CartSideBar = () => {
    const dispatch = useDispatch();
    const cartItems = useSelector(getCartItems);

    useEffect(() => {
        dispatch(fetchCartItems());
    }, [dispatch])

    return (
        <div className='cart'>
            <div className='cart-header'>

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