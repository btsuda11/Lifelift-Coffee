import './CartItem.css';
import { Link } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { deleteCartItem } from '../../../../actions/cartItemActions';

const CartItem = ({ item, cartTotal, setCartTotal }) => {
    const dispatch = useDispatch();

    const removeItem = e => {
        e.preventDefault();
        setCartTotal(cartTotal - item.price);
        dispatch(deleteCartItem(item.id));
    }

    return (
        <div className='cart-item-div'>
            <div className='cart-item-img' />
            <div className='cart-item-info'>
                <h5>{item.name}</h5>
                <p>{item.productType} / {item.amount}</p>
                <div>
                    <div className='quantity-div'>
                        <button>-</button>
                        <div>{item.quantity}</div>
                        <button>+</button>
                    </div>
                    <p>${(item.price).toFixed(2)}</p>
                </div>
                <Link to='#' onClick={removeItem}>X Remove</Link>
            </div>
        </div>
    )
}

export default CartItem;