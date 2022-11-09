import './ReviewIndex.css';
import ReviewIndexItem from './ReviewIndexItem';
import ReviewForm from '../ReviewForm';
import { useState } from 'react';
import { useSelector } from 'react-redux';
import { FaStar, FaStarHalfAlt, FaRegStar } from 'react-icons/fa';

const ReviewIndex = ({ reviews, product }) => {
    const [showCreateReview, setShowCreateReview] = useState(false);
    const [showEditReview, setShowEditReview] = useState(false);
    const [loginReviewError, setLoginReviewError] = useState('');
    const [reviewErrors, setReviewErrors] = useState([]);
    const currentUserId = useSelector(state => state.session.currentUser);

    const sortedReviews = [...reviews].reverse();

    const numberReviews = rating => (
        reviews.reduce((acc, a) => {
            if (a.rating === rating) return acc + 1
            else return acc;
        }, 0)
    )

    const percentageReviews = rating => {
        if (reviews.length === 0) return 0
        else return (numberReviews(rating) / reviews.length).toFixed(2) * 100;
    }

    return (
        <section className='reviews-section'>
            <div>
                <div className='reviews-div'>
                    <div className='reviews-header'>
                        <h2>Customer Reviews</h2>
                        <div>
                            <div className='reviews-breakdown-div'>
                                <div>
                                    {avgStarRating(avgRating(reviews))}
                                    <p>Based on {sortedReviews.length > 1 || sortedReviews.length === 0 ? `${sortedReviews.length} reviews` : `${sortedReviews.length} review`}</p>
                                </div>
                                <div className='reviews-percentage-div'>
                                    <div className='specific-star-div'>
                                        <div>
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                        </div>
                                        <div className='percentage-div' style={{background: `linear-gradient(to right, #fbcd0a ${percentageReviews(5)}%, white ${percentageReviews(5)}%)`}}></div>
                                        <p>{percentageReviews(5)}%</p>
                                        <p>({numberReviews(5)})</p>
                                    </div>
                                    <div className='specific-star-div'>
                                        <div>
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaRegStar className='star' />
                                        </div>
                                        <div className='percentage-div' style={{background: `linear-gradient(to right, #fbcd0a ${percentageReviews(4)}%, white ${percentageReviews(4)}%)`}}></div>
                                        <p>{percentageReviews(4)}%</p>
                                        <p>({numberReviews(4)})</p>
                                    </div>
                                    <div className='specific-star-div'>
                                        <div>
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaRegStar className='star' />
                                            <FaRegStar className='star' />
                                        </div>
                                        <div className='percentage-div' style={{background: `linear-gradient(to right, #fbcd0a ${percentageReviews(3)}%, white ${percentageReviews(3)}%)`}}></div>
                                        <p>{percentageReviews(3)}%</p>
                                        <p>({numberReviews(3)})</p>
                                    </div>
                                    <div className='specific-star-div'>
                                        <div>
                                            <FaStar className='star' />
                                            <FaStar className='star' />
                                            <FaRegStar className='star' />
                                            <FaRegStar className='star' />
                                            <FaRegStar className='star' />
                                        </div>
                                        <div className='percentage-div' style={{background: `linear-gradient(to right, #fbcd0a ${percentageReviews(2)}%, white ${percentageReviews(2)}%)`}}></div>
                                        <p>{percentageReviews(2)}%</p>
                                        <p>({numberReviews(2)})</p>
                                    </div>
                                    <div className='specific-star-div'>
                                        <div>
                                            <FaStar className='star' />
                                            <FaRegStar className='star' />
                                            <FaRegStar className='star' />
                                            <FaRegStar className='star' />
                                            <FaRegStar className='star' />
                                        </div>
                                        <div className='percentage-div' style={{background: `linear-gradient(to right, #fbcd0a ${percentageReviews(1)}%, white ${percentageReviews(1)}%)`}}></div>
                                        <p>{percentageReviews(1)}%</p>
                                        <p>({numberReviews(1)})</p>
                                    </div>
                                </div>
                            </div>
                            <div>
                                {showCreateReview ? <button className='review-btn' onClick={() => {
                                    setShowCreateReview(false);
                                    setReviewErrors([]);
                                }}>Cancel review</button> : 
                                <button className='review-btn' onClick={() => {
                                    if (currentUserId) {
                                        setShowCreateReview(true);
                                        setShowEditReview(false);
                                    } else {
                                        setLoginReviewError('Must be logged in to write reviews');
                                    }
                                }}>Write a review</button>}
                            </div>
                        </div>
                    </div>
                    { loginReviewError.length > 0 &&
                        <ul className='errors'>
                            <li>{loginReviewError}</li>
                        </ul>}
                    { showCreateReview &&
                        <ReviewForm product={product} setShowCreateReview={setShowCreateReview} reviewErrors={reviewErrors} setReviewErrors={setReviewErrors} />
                    }
                    <div className='reviews-body'>
                        {sortedReviews.map(review => <ReviewIndexItem review={review} key={review.id} showEditReview={showEditReview} setShowEditReview={setShowEditReview} setShowCreateReview={setShowCreateReview} reviewErrors={reviewErrors} setReviewErrors={setReviewErrors} />)}
                    </div>
                </div>
            </div>
        </section>
    )
}

export default ReviewIndex;

export const avgRating = reviews => {
    if (reviews.length === 0) return 0
    else return Math.round((reviews.reduce((acc, a) => acc + a.rating, 0) / reviews.length) * 2) / 2;
}

export const avgStarRating = avgRating => {
    const stars = [<FaRegStar className='star' />, <FaRegStar className='star' />, <FaRegStar className='star' />, <FaRegStar className='star' />, <FaRegStar className='star' />];
    const wholeNumber = Math.floor(avgRating % 10);
    const decimal = avgRating % wholeNumber;
    for (let i = 0; i < stars.length; i++) {
        if (i < wholeNumber) {
            stars[i] = <FaStar className='star' />
        } else if (i === wholeNumber && decimal === 0.5) {
            stars[i] = <FaStarHalfAlt className='star' />
        }
    }
    return stars;
}