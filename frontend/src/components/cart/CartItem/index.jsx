import './CartItem.css';
import { Link } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { deleteCartItem, updateCartItem } from '../../../actions/cartItemActions';

const CartItem = ({ item, cartTotal }) => {
    const dispatch = useDispatch();

    const removeItem = e => {
        e.preventDefault();
        dispatch(deleteCartItem(item.id));
    }

    const incrementQuantity = () => {
        dispatch(updateCartItem({ ...item, quantity: item.quantity + 1 }));
    }

    const decrementQuantity = () => {
        if (item.quantity === 1) {
            dispatch(deleteCartItem(item.id));
        } else {
            dispatch(updateCartItem({ ...item, quantity: item.quantity - 1 }));
        }
    }

    return (
        <div className='cart-item-div'>
            <div className='cart-item-img' />
            <div className='cart-item-info'>
                <h5>{item.name}</h5>
                { item.productType &&
                    <p>{item.productType} / {item.amount}</p>
                }
                { !item.productType && 
                    <p>{item.amount}</p>
                }
                <div>
                    <div className='quantity-div'>
                        <button onClick={decrementQuantity}>-</button>
                        <div>{item.quantity}</div>
                        <button onClick={incrementQuantity}>+</button>
                    </div>
                    <p>${(item.price).toFixed(2)}</p>
                </div>
                <Link to='#' onClick={removeItem}>X Remove</Link>
            </div>
        </div>
    )
}

export default CartItem;