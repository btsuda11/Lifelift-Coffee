import './WelcomeComponent.css';
import subscription from '../../../../assets/LoginPage/subscription.svg';
import shipping from '../../../../assets/LoginPage/shipping.svg';
import access from '../../../../assets/LoginPage/access.svg';
import { Link } from 'react-router-dom';

const WelcomeComponent = () => {

    return (
        <div className='welcome-box'>
            <h2>Welcome to Lifelift</h2>
            <p className='narrow spaced'>Sign up to receive early access and the latest news on all things Lifelift related.</p>
            <div className='icon-box'>
                <div>
                    <img src={subscription} />
                    <p className='narrow spaced'>Customizable Subscription</p>
                </div>
                <div>
                    <img src={shipping} />
                    <p className='narrow spaced'>Faster Shipping</p>
                </div>
                <div>
                    <img src={access} />
                    <p className='narrow spaced'>Early Access</p>
                </div>
            </div>
            <p className='narrow spaced'>Not a Lifelift member? Register now</p>
            <Link className='red-btn' to='/account/register'>Register your Account</Link>
        </div>
    )
}

export default WelcomeComponent;