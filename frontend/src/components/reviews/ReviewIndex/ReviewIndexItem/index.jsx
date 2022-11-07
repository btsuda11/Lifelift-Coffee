import './ReviewIndexItem.css';
import { FaStar } from 'react-icons/fa';

const ReviewIndexItem = ({ review }) => {
    const ratingToStars = rating => {
        let stars = [];
        for (let i = 0; i < rating; i++) {
            stars.push(<FaStar className='star' />)
        }
        return stars;
    }

    return (
        <div className='review-item-div'>
            <div className='review-header'>
                <div className='reviewer-icon'>{review.firstName[0].toUpperCase()}</div>
                <div className='review-header-info'>
                    <div>
                        <div className='rating-div'>{ratingToStars(review.rating)}</div>
                        <p>{review.createdAt}</p>
                    </div>
                    <p className='light-bold'>{review.firstName + ' ' + review.lastName}</p>
                </div>
            </div>
            <div className='review-body'>
                <p className='light-bold'>{review.title}</p>
                <p>{review.body}</p>
            </div>
        </div>
    )
}

export default ReviewIndexItem;