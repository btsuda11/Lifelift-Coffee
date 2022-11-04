import './Header.css';
import { useSelector } from 'react-redux';
import { getCartItems } from '../../actions/cartItemActions';
import { Link } from 'react-router-dom';
import account from '../../images/Header/account.svg';
import search from '../../images/Header/search.svg';
import cart from '../../images/Header/cart.svg';
import openBar from '../../images/Header/open-bar.svg';
import DropDownMenu from './DropDownMenu';

const Header = ({ setShowCart, closeCart }) => {

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
                        <Link to='#'>
                            <img id='cart' src={cart} onClick={() => setShowCart(true)} />
                            {/* <svg id="cart-count" width="19.622" height="19.622" >
                                <circle cx="9.811" cy="9.811" r="9.811" fill="#fe3c38">
                                </circle>
                            </svg> */}
                        </Link>
                    </div>
                </div>
            </header>
        </>
    )
}

export default Header;