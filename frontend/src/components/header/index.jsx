import './Header.css';
import { useSelector } from 'react-redux';
import { getCartItems } from '../../actions/cartItemActions';
import { Link } from 'react-router-dom';
import account from '../../assets/Header/account.svg';
import search from '../../assets/Header/search.svg';
import cart from '../../assets/Header/cart.svg';
import openBar from '../../assets/Header/open-bar.svg';
import DropDownMenu from './DropDownMenu';

const Header = ({ setShowCart, closeCart }) => {
    const currentUserId = useSelector(state => state.session.currentUser);
    const numberCartItems = useSelector(getCartItems).reduce((acc, a) => {
        if (a.shopperId === currentUserId) {
            return acc + a.quantity;
        } else {
            return acc;
        }
    }, 0);

    return (
        <>
            <header onClick={closeCart}>
                <div className='header-div'>
                    <div>
                        <nav className='dropdown'>
                            <div>
                                <Link to='#' className='shop-btn'>Shop
                                    <img src={openBar}/>
                                </Link>
                            </div>
                            <DropDownMenu />
                        </nav>
                    </div>
                    <div className='logo'>
                        <Link to='/'><h2>Lifelift Coffee</h2></Link>
                    </div>
                    <div className='icon-bar'>
                        <Link to='/account'>
                            <img src={account} />
                        </Link>
                        <Link to='#'>
                            <img src={search} />
                        </Link>
                        <Link to='#' className='cart-link'>
                            <img id='cart' src={cart} onClick={() => setShowCart(true)} />
                            <div className='items-quantity'>{numberCartItems}</div>
                        </Link>
                    </div>
                </div>
            </header>
        </>
    )
}

export default Header;