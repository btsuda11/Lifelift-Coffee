import './ProductIndexItem.css';
import { Link } from 'react-router-dom';
import { avgStarRating } from '../../../reviews/ReviewIndex';

const ProductIndexItem = ({ product, search }) => {
    const trimmedDescription = () => {
        const trimmedString = product.description.substring(0, 125);
        return trimmedString.substring(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")));
    }

    return (
        <div className='product-container'>
            <div className='product-image-container'>
                <Link to={`/product/${dashify(product.name)}`}>
                    <div className='product-img' style={{backgroundImage: `url(${product.photoUrls[0]})`}}/>
                    {/* <div className='product-img' /> */}
                </Link>
            </div>
            <div className='product-index-item'>
                <h3>{product.name}</h3>
                { !search ?
                    <div>
                        {avgStarRating(product.avgRating)}
                        <div className='number-reviews-div'>
                            <p>{product.numReviews > 1 || product.numReviews === 0 ? `${product.numReviews} reviews` : `${product.numReviews} review`}</p>
                        </div>
                    </div> :
                    <p>{trimmedDescription() + '...'}</p>
                }
                <Link className='red-btn' to={`/product/${dashify(product.name)}`}>View Product</Link>
            </div> 
        </div>
    )
}

export default ProductIndexItem;

export const dashify = name => {
    const newName = name.split(' ').map(word => (word[0].toLowerCase() + word.slice(1).toLowerCase()))
    return newName.join('-');
}