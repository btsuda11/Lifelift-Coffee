import './WelcomeComponent.css';
import { Link } from 'react-router-dom';

const WelcomeComponent = () => {

    return (
        <div className='welcome-box'>
            <h2>Welcome to Lifelift</h2>
            <p>Sign up to receive early access and the latest news on all things Lifelift related.</p>
            <p>Not a Lifelift member? Register now</p>
            <Link className='red-btn' to='/account/register'>Register your Account</Link>
        </div>
    )
}

export default WelcomeComponent;