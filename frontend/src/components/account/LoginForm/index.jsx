import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { loginUser } from '../../../actions/sessionActions';
import { Redirect } from 'react-router-dom';
import './LoginForm.css'

const LoginForm = () => {
    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);

    if (currentUserId) return <Redirect to='/' />;

    const handleLogin = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(loginUser({ email, password }))
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
            <h2>Sign In</h2>
            <p>Log in to your Lifelift account</p>
            <div>
                <ul className='errors'>
                    {errors.map(error => <li key={error}>{error}</li>)}
                </ul>
            </div>
            <form onSubmit={handleLogin}>
                <input className='text-field' type='text' placeholder='Email' value={email} onChange={e => setEmail(e.target.value)} required />
                <input className='text-field' type='password' placeholder='Password' value={password} onChange={e => setPassword(e.target.value)} required />
                <button className='red-btn' type='submit'>Sign in</button>
            </form>
        </>
    )
}

export default LoginForm;