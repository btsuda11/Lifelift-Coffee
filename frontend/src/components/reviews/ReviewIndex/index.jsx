import './ReviewIndex.css';
import ReviewIndexItem from './ReviewIndexItem';
import ReviewForm from '../ReviewForm';
import { useState } from 'react';
import { FaStar } from 'react-icons/fa';

const ReviewIndex = ({ reviews }) => {
    const [showReviewForm, setShowReviewForm] = useState(false);

    return (
        <section className='reviews-section'>
            <div>
                <div className='reviews-div'>
                    <div className='reviews-header'>
                        <h2>Customer Reviews</h2>
                        <div>
                            <div>
                                <FaStar className='star' />
                                <FaStar className='star' />
                                <FaStar className='star' />
                                <FaStar className='star' />
                                <FaStar className='star' />
                                <p>Based on {reviews.length > 1 || reviews.length === 0 ? `${reviews.length} reviews` : `${reviews.length} review`}</p>
                            </div>
                            <div>

                            </div>
                            <div>
                                {showReviewForm ? <button className='review-btn' onClick={() => setShowReviewForm(false)}>Cancel review</button> : <button className='review-btn' onClick={() => setShowReviewForm(true)}>Write a review</button>}
                            </div>
                        </div>
                    </div>
                    { showReviewForm &&
                        <ReviewForm />
                    }
                    <div className='reviews-body'>
                        {reviews.map(review => <ReviewIndexItem review={review} />)}
                    </div>
                </div>
            </div>
        </section>
    )
}

export default ReviewIndex;