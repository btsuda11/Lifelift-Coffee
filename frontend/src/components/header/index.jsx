import './Header.css';
import { Link } from 'react-router-dom';
import account from '../../images/Header/account.svg';
import search from '../../images/Header/search.svg';
import cart from '../../images/Header/cart.svg';
import openBar from '../../images/Header/open-bar.svg';
import DropDownMenu from './DropDownMenu';
import CartSideBar from './Cart';

const Header = ({ showCart, setShowCart, cartTotal, setCartTotal }) => {
    return (
        <>
            { showCart &&
                <CartSideBar setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} /> } 
            <header>
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
                            <img src={cart} onClick={() => setShowCart(true)} />
                        </Link>
                    </div>
                </div>
            </header>
        </>
    )
}

export default Header;