import './Header.css';
import { Link } from 'react-router-dom';
import account from '../../images/Header/account.svg';
import search from '../../images/Header/search.svg';
import cart from '../../images/Header/cart.svg';
import openBar from '../../images/Header/open-bar.svg';
import DropDownMenu from './DropDownMenu';

const Header = () => {
    return (
        <header>
            <div className='header-div'>
                <nav className='dropdown'>
                    <div>
                        <Link to='#' className='shop-btn'>Shop
                            <img src={openBar}/>
                        </Link>
                    </div>
                    <DropDownMenu />
                </nav>
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
                        <img src={cart} />
                    </Link>
                </div>
            </div>
        </header>
    )
}

export default Header;