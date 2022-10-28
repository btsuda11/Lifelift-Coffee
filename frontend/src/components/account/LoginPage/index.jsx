import LoginForm from "./LoginForm";
import './LoginPage.css';
import WelcomeComponent from "./WelcomeComponent";

const LoginPage = () => {
    return (
        <section className='login-section'>
            <div>
                <WelcomeComponent />
                <LoginForm />
            </div>
        </section>
    )
}

export default LoginPage;