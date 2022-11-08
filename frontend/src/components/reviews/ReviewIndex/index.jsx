import './ReviewIndex.css';
import ReviewIndexItem from './ReviewIndexItem';
import ReviewForm from '../ReviewForm';
import { useState } from 'react';
import { FaStar } from 'react-icons/fa';

const ReviewIndex = ({ reviews, product }) => {
    const [showCreateReview, setShowCreateReview] = useState(false);
    const [showEditReview, setShowEditReview] = useState(false);
    const sortedReviews = [...reviews].reverse();

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
                                <p>Based on {sortedReviews.length > 1 || sortedReviews.length === 0 ? `${sortedReviews.length} reviews` : `${sortedReviews.length} review`}</p>
                            </div>
                            <div>

                            </div>
                            <div>
                                {showCreateReview ? <button className='review-btn' onClick={() => setShowCreateReview(false)}>Cancel review</button> : <button className='review-btn' onClick={() => {
                                    setShowCreateReview(true);
                                    setShowEditReview(false);
                                }}>Write a review</button>}
                            </div>
                        </div>
                    </div>
                    { showCreateReview &&
                        <ReviewForm product={product} setShowCreateReview={setShowCreateReview} />
                    }
                    <div className='reviews-body'>
                        {sortedReviews.map(review => <ReviewIndexItem review={review} key={review.id} showEditReview={showEditReview} setShowEditReview={setShowEditReview} setShowCreateReview={setShowCreateReview} />)}
                    </div>
                </div>
            </div>
        </section>
    )
}

export default ReviewIndex;