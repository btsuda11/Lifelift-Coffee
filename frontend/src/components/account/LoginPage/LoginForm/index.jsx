import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { loginUser } from '../../../../actions/sessionActions';
import { Link, Redirect } from 'react-router-dom';
import './LoginForm.css';

const LoginForm = () => {
    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);

    if (currentUserId) return <Redirect to='/account' />;

    const handleLogin = e => {
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

    const handleDemo = e => {
        e.preventDefault();
        dispatch(loginUser({ email: 'demo@user.io', password: 'password' }));
    }

    return (
        <div className='login-box'>
            <form onSubmit={handleLogin}>
                <h2>Sign In</h2>
                <p className='textp'>Log in to your Lifelift account</p>
                <div>
                    <ul className='errors'>
                        {errors.map(error => <li key={error}>{error}</li>)}
                    </ul>
                </div>
                <input className='login-field' type='text' placeholder='Email' value={email} onChange={e => setEmail(e.target.value)} required />
                <input className='login-field' type='password' placeholder='Password' value={password} onChange={e => setPassword(e.target.value)} required />
                <button className='red-btn sign-in' type='submit'>Sign in</button>
                <Link className='underline-on-hover' onClick={handleDemo}>Log in as Demo User</Link>
            </form>
        </div>
    )
}

export default LoginForm;