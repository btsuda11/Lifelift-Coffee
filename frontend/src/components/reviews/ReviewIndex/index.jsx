import './ReviewIndex.css';
import ReviewIndexItem from './ReviewIndexItem';

const ReviewIndex = ({ reviews }) => {
    return (
        <section className='reviews-section'>
            <div>
                <div className='reviews-div'>
                    <div className='reviews-header'>
                        <h3>Customer Reviews</h3>
                        <div>

                        </div>
                        <div>

                        </div>
                        <div>
                            
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