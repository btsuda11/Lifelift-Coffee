import './ReviewForm.css';

const ReviewForm = () => {
    const submitReview = e => {
        e.preventDefault();
    }

    return (
        <form onSubmit={submitReview}>
            <h1>form</h1>
        </form>
    )
}

export default ReviewForm;