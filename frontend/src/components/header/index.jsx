import './Header.css';
import { useSelector } from 'react-redux';
import { getCartItems } from '../../actions/cartItemActions';
import { Link } from 'react-router-dom';
import account from '../../assets/Header/account.svg';
import search from '../../assets/Header/search.svg';
import cart from '../../assets/Header/cart.svg';
import openBar from '../../assets/Header/open-bar.svg';
import DropDownMenu from './DropDownMenu';
import logo from '../../assets/Header/coffee-logo.png';

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
                        <Link to='/'>
                            <img src={logo} />
                            <p className='lighter logo-text-big'>LIFELIFT</p>
                            <p className='lighter logo-text-small'>coffee</p>
                        </Link>
                    </div>
                    <div className='icon-bar'>
                        <Link to='/account'>
                            <img src={account} />
                        </Link>
                        <Link to='/search'>
                            <img src={search} />
                        </Link>
                        <Link to='#' className='cart-link' onClick={e => e.preventDefault()}>
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