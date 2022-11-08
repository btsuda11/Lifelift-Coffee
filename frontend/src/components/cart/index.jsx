import { useDispatch, useSelector } from 'react-redux';
import { getCartItems, deleteCartItem } from '../../actions/cartItemActions';
import CartItem from './CartItem';
import { Link } from 'react-router-dom';
import './CartSideBar.css';
import { AiOutlineRight } from 'react-icons/ai';

const CartSideBar = ({ showCart, setShowCart, cartTotal, setCartTotal, closeCart, setShowCheckoutModal, cartErrors }) => {
    const dispatch = useDispatch();
    const cartItems = useSelector(getCartItems);
    const currentUserId = useSelector(state => state.session.currentUser);
    
    setCartTotal(cartItems.reduce((acc, a) => {
        if (a.shopperId === currentUserId) {
            return acc + (a.price * a.quantity);
        } else {
            return acc;
        }
    }, 0))

    const checkout = () => {
        closeCart();
        if (currentUserId) {
            setShowCheckoutModal(true);
            cartItems.forEach(item => {
                if (item.shopperId === currentUserId) {
                    dispatch(deleteCartItem(item.id))
                }
            });
        }
    }

    return (
        <div className={`cart ${showCart ? 'translate-x-0 right-25' : 'translate-x-full'} ease-in-out duration-400`}>
            <div className='cart-header'>
                <div>
                    <h3>Your Cart</h3>
                    { showCart && <AiOutlineRight style={{cursor: 'pointer'}} onClick={() => setShowCart(false)} /> }
                </div>
            </div>
            <div className='cart-items'>
                { cartErrors.length > 0 &&
                    <ul className='errors'>
                        {cartErrors.map(error => <li key={error}>{error}</li>)}
                    </ul>}
                {cartItems.map( (item) => {
                    if (currentUserId === item.shopperId) return <CartItem item={item} key={item.id} cartTotal={cartTotal} />
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
                <Link to='/account' onClick={checkout}>Continue Checkout</Link>
            </div>
        </div>
    )
}

export default CartSideBar;