import './ReviewIndex.css';
import ReviewIndexItem from './ReviewIndexItem';
import { FaStar } from 'react-icons/fa';

const ReviewIndex = ({ reviews }) => {
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
                                <button className='review-btn'>Write a review</button>
                            </div>
                        </div>
                    </div>
                    <div className='reviews-body'>
                        {reviews.map(review => <ReviewIndexItem review={review} />)}
                    </div>
                </div>
            </div>
        </section>
    )
}

export default ReviewIndex;