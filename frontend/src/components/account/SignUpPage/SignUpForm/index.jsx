import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { signUpUser } from '../../../../actions/sessionActions';
import { Redirect } from 'react-router-dom';
import './SignUpForm.css';

const SignUpForm = () => {
    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);

    if (currentUserId) return <Redirect to='/account' />;

    const handleSignUp = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(signUpUser({ user: {firstName, lastName, email, password} }))
            .catch(async (res) => {
                let data;
                try {
                    // .clone() essentially allows you to read the response body twice
                    data = await res.clone().json();
                } catch {
                    data = await res.text(); // Will hit this case if the server is down
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
            });
    }

    return (
        <>
            <form className='signup-form' onSubmit={handleSignUp}>
                <h2>Sign Up</h2>
                <p>Create your Lifelift account</p>
                <div>
                    <ul className='errors'>
                        {errors.map(error => <li key={error}>{error}</li>)}
                    </ul>
                </div>
                <input className='text-field' type='text' placeholder='First Name' value={firstName} onChange={e => setFirstName(e.target.value)} required />
                <input className='text-field' type='text' placeholder='Last Name' value={lastName} onChange={e => setLastName(e.target.value)} required />
                <input className='text-field' type='text' placeholder='Email' value={email} onChange={e => setEmail(e.target.value)} required />
                <input className='text-field' type='password' placeholder='Password' value={password} onChange={e => setPassword(e.target.value)} required />
                <button className='red-btn' type='submit'>Register now</button>
            </form>
        </>
    )
}

export default SignUpForm;