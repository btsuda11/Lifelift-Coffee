import './Footer.css';
import { Link } from 'react-router-dom';
import linkedIn from '../../images/Footer/linkedin.png';
import gitHub from '../../images/Footer/github.png';


const Footer = ({ closeCart }) => {
    return (
        <footer onClick={closeCart}>
            <div>
                <a href='https://www.linkedin.com/in/brendan-tsuda/'>
                    <img src={linkedIn} />
                </a>
                <a href='https://github.com/btsuda11'>
                    <img src={gitHub} />
                </a>
            </div>
        </footer>
    )
}

export default Footer;