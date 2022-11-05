import './Footer.css';
import { Link } from 'react-router-dom';
import linkedIn from '../../images/Footer/linkedin.png';
import gitHub from '../../images/Footer/github.png';


const Footer = ({ closeCart }) => {
    return (
        <footer onClick={closeCart}>
            <div>
                <Link to='https://www.linkedin.com/in/brendan-tsuda/'>
                    <img src={linkedIn} />
                </Link>
                <Link to='https://github.com/btsuda11'>
                    <img src={gitHub} />
                </Link>
            </div>
        </footer>
    )
}

export default Footer;