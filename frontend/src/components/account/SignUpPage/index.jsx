import SignUpForm from './SignUpForm';
import './SignUpPage.css';

const SignUpPage = ({ closeCart }) => {
    return (
        <section className='signup-section' onClick={closeCart}>
            <div className='signup'/>
            <SignUpForm />
        </section>
    )
}

export default SignUpPage;