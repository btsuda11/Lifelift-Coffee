import './DropDownMenu.css';
import { Link } from 'react-router-dom';
import shopAll from '../../../images/Header/shop-all.jpeg';
import roasts from '../../../images/Header/light-medium-dark-roasts.jpeg';
import decaf from '../../../images/Header/decaf-coffee.jpeg';
import flavored from '../../../images/Header/flavored-coffee.jpeg';
import pods from '../../../images/Header/coffee-pods.jpeg';
import boosters from '../../../images/Header/health-boosters.jpeg';

const DropDownMenu = () => {
    return (
        <div className='dropdown-content'>
            <div className='shop-box border-right'>
                <Link to='/products'>
                    <img className='shop-img' src={shopAll}/>
                    <strong>Shop All</strong>
                </Link>
            </div>
            <div className='categories'>
                <div className='category-box border-right'>
                    <Link to='/products/light-medium-dark-roasts'>
                        <img className='category-img' src={roasts}/>
                        <strong className='narrow'>Light, Medium & Dark Roasts</strong>
                    </Link>
                </div>
                <div className='category-box border-right'>
                    <Link to='/products/decaf-coffee'>
                        <img className='category-img' src={decaf}/>
                        <strong>Decaf Coffee</strong>
                    </Link>
                </div>
                <div className='category-box border-right'>
                    <Link to='/products/flavored-coffee'>
                        <img className='category-img' src={flavored}/>
                        <strong>Flavored Coffee</strong>
                    </Link>
                </div>
                <div className='category-box border-right'>
                    <Link to='/products/coffee-pods'>
                        <img className='category-img' src={pods}/>
                        <strong>Coffee Pods</strong>
                    </Link>
                </div>
                <div className='category-box'>
                    <Link to='/products/health-boosters'>
                        <img className='category-img' src={boosters}/>
                        <strong>Health Boosters</strong>
                    </Link>
                </div>
            </div>
        </div>
    )
}

export default DropDownMenu;