import './ReviewIndexItem.css';
import { FaStar } from 'react-icons/fa';
import { FiEdit } from 'react-icons/fi';
import { AiOutlineDelete } from 'react-icons/ai';
import { useSelector } from 'react-redux';

const ReviewIndexItem = ({ review }) => {
    const currentUserId = useSelector(state => state.session.currentUser);

    const ratingToStars = rating => {
        let stars = [];
        for (let i = 0; i < rating; i++) {
            stars.push(<FaStar className='star' />)
        }
        return stars;
    }

    return (
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
                        <FiEdit className='edit'/>
                        <AiOutlineDelete className='delete'/>
                    </div>}
            </div>
            <div className='review-body'>
                <p className='light-bold'>{review.title}</p>
                <p>{review.body}</p>
            </div>
        </div>
    )
}

export default ReviewIndexItem;