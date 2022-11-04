import LoginForm from "./LoginForm";
import './LoginPage.css';
import WelcomeComponent from "./WelcomeComponent";

const LoginPage = ({ closeCart }) => {
    return (
        <section className='login-section' onClick={closeCart}>
            <div>
                <WelcomeComponent />
                <LoginForm />
            </div>
        </section>
    )
}

export default LoginPage;