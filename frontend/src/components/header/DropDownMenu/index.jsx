import './DropDownMenu.css';
import { Link } from 'react-router-dom';

const DropDownMenu = () => {
    return (
        <div className='dropdown-content'>
            <div>
                <Link to='#'>
                    <img />
                    <strong>Shop All</strong>
                </Link>
            </div>
            <div className='categories'>
                <div>
                    <Link to='#'>
                        <img />
                        <strong>Light, Medium & Dark Roasts</strong>
                    </Link>
                </div>
                <div>
                    <Link to='#'>
                        <img />
                        <strong>Decaf Coffee</strong>
                    </Link>
                </div>
                <div>
                    <Link to='#'>
                        <img />
                        <strong>Flavored Coffee</strong>
                    </Link>
                </div>
                <div>
                    <Link to='#'>
                        <img />
                        <strong>Coffee Pods</strong>
                    </Link>
                </div>
                <div>
                    <Link to='#'>
                        <img />
                        <strong>Health Boosters</strong>
                    </Link>
                </div>
            </div>
        </div>
    )
}

export default DropDownMenu;