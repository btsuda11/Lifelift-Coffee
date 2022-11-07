import './ReviewIndexItem.css';

const ReviewIndexItem = ({ review }) => {
    return (
        <>
            <h3>{review.body}</h3>
        </>
    )
}

export default ReviewIndexItem;