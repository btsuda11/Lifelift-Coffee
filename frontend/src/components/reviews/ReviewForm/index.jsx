import './ReviewForm.css';
import { FaStar } from 'react-icons/fa';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { createReview } from '../../../actions/reviewActions';

const ReviewForm = ({ product }) => {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [rating, setRating] = useState([false, false, false, false, false]);
    const [title, setTitle] = useState('');
    const [body, setBody] = useState('');

    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);

    const submitReview = e => {
        e.preventDefault();
        dispatch(createReview({ title, body, rating, reviewerId: currentUserId, productId: product[0].id }))
    }

    return (
        <form onSubmit={submitReview} className='review-form'>
            <div className='name-input'>
                <label htmlFor='name'>Name (displayed publicly as <select>
                        <option>John Smith</option>
                        <option>John S.</option>
                        <option>J.S.</option>
                        <option>Anonymous</option>
                    </select>)
                </label>
                <input type='text' placeholder='Enter your name (public)' id='name' value={name} />
            </div>
            <label>Email
                <input type='text' placeholder='Enter your email (private)' value={email} />
            </label>
            <label>Rating</label>
            <div>
                <FaStar className='star' />
                <FaStar className='star' />
                <FaStar className='star' />
                <FaStar className='star' />
                <FaStar className='star' />
            </div>
            <label>Review Title
                <input type='text' placeholder='Give your review a title' value={title} />
            </label>
            <label>Review
                <textarea placeholder='Write your comments here' value={body} />
            </label>
        </form>
    )
}

export default ReviewForm;