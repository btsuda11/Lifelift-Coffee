import './ReviewIndexItem.css';
import { FaStar } from 'react-icons/fa';
import { FiEdit } from 'react-icons/fi';
import { AiOutlineDelete } from 'react-icons/ai';
import { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { deleteReview } from '../../../../actions/reviewActions';
import ReviewForm from '../../ReviewForm';

const ReviewIndexItem = ({ review }) => {
    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);
    const [showEditReview, setShowEditReview] = useState(false);

    const ratingToStars = rating => {
        let stars = [];
        for (let i = 0; i < rating; i++) {
            stars.push(<FaStar className='star' />)
        }
        return stars;
    }

    return (
        <>
            <div className='review-item-div'>
                <div>
                    <div className='review-header'>
                        <div className='reviewer-icon'>{review.reviewerName[0].toUpperCase()}</div>
                        <div className='review-header-info'>
                            <div>
                                <div className='rating-div'>{ratingToStars(review.rating)}</div>
                                <p>{review.createdAt}</p>
                            </div>
                            <p className='light-bold'>{review.reviewerName}</p>
                        </div>
                    </div>
                    { currentUserId === review.reviewerId &&
                        <div className='modify-icon-div'>
                            <FiEdit className='edit' onClick={() => setShowEditReview(!showEditReview)}/>
                            <AiOutlineDelete className='delete' onClick={() => dispatch(deleteReview(review.id))} />
                        </div>}
                </div>
                <div className='review-body'>
                    <p className='light-bold'>{review.title}</p>
                    <p>{review.body}</p>
                </div>
            </div>
            { showEditReview && 
                <ReviewForm review={review} setShowEditReview={setShowEditReview} />
            }
        </>
    )
}

export default ReviewIndexItem;