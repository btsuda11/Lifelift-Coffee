import './Header.css';
import { Link } from 'react-router-dom';
import account from '../../images/Header/account.svg';
import search from '../../images/Header/search.svg';
import cart from '../../images/Header/cart.svg';
import openBar from '../../images/Header/open-bar.svg';

const Header = () => {
    return (
        <header>
            <div className='header-div'>
                <nav>
                    <div className='shop'>
                        <Link to='#'>Shop
                            <img src={openBar}/>
                        </Link>
                    </div>
                </nav>
                <div className='logo'>
                    <Link to='/'>Lifelift Coffee</Link>
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