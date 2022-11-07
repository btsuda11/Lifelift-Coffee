import './ReviewForm.css';
import { FaStar } from 'react-icons/fa';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { createReview } from '../../../actions/reviewActions';
import { Link } from 'react-router-dom';

const ReviewForm = ({ product }) => {
    const [reviewerName, setReviewerName] = useState('');
    const [email, setEmail] = useState('');
    const [clickedRating, setClickedRating] = useState([true, true, true, true, true]);
    const [title, setTitle] = useState('');
    const [body, setBody] = useState('');

    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);

    const handleStarClick = (e, index) => {
        e.preventDefault();
        let clickedStars = [...clickedRating];
        for (let i = 0; i < clickedStars.length; i++) {
            if (i <= index) clickedStars[i] = true;
            else clickedStars[i] = false;
        }
        setClickedRating(clickedStars);
    }

    const submitReview = e => {
        e.preventDefault();
        let rating;
        for (let i = clickedRating.length - 1; i >= 0; i--) {
            if (clickedRating[i] === true) {
                rating = i + 1;
                break;
            }
        }
        dispatch(createReview({ review: {reviewerName, title, body, rating, reviewerId: currentUserId, productId: product[0].id} }));
        setReviewerName('');
        setEmail('');
        setClickedRating([true, true, true, true, true]);
        setTitle('');
        setBody('');
    }

    return (
        <form className='review-form'>
            <div>
                <label htmlFor='name'>Name (displayed publicly as <select>
                        <option>John Smith</option>
                        <option>John S.</option>
                        <option>J.S.</option>
                        <option>Anonymous</option>
                    </select>)
                </label>
                <input type='text' placeholder='Enter your name (public)' id='name' value={reviewerName} onChange={e => setReviewerName(e.target.value)} />
            </div>
            <div>
                <label htmlFor='email'>Email</label>
                <input id='email' type='text' placeholder='Enter your email (private)' value={email} onChange={e => setEmail(e.target.value)} />
            </div>
            <div>
                <label htmlFor='rating'>Rating</label>
                <div className='rating-div' id='rating'>
                    <FaStar className={clickedRating[0] ? 'clicked-rating' : 'rating'} onClick={e => handleStarClick(e, 0)} />
                    <FaStar className={clickedRating[1] ? 'clicked-rating' : 'rating'} onClick={e => handleStarClick(e, 1)} />
                    <FaStar className={clickedRating[2] ? 'clicked-rating' : 'rating'} onClick={e => handleStarClick(e, 2)} />
                    <FaStar className={clickedRating[3] ? 'clicked-rating' : 'rating'} onClick={e => handleStarClick(e, 3)} />
                    <FaStar className={clickedRating[4] ? 'clicked-rating' : 'rating'} onClick={e => handleStarClick(e, 4)} />
                </div>
            </div>
            <div>
                <label htmlFor='title'>Review Title</label>
                <input id='title' type='text' placeholder='Give your review a title' value={title} onChange={e => setTitle(e.target.value)} />
            </div>
            <div>
                <label htmlFor='body'>Review</label>
                <textarea id='body' placeholder='Write your comments here' value={body} onChange={e => setBody(e.target.value)} />
            </div>
            <Link className='underline-on-hover spaced' to='#' onClick={submitReview}>Submit Review</Link>
        </form>
    )
}

export default ReviewForm;