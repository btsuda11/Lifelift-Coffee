import './ProductIndexItem.css';
import { Link } from 'react-router-dom';

const ProductIndexItem = ({ product }) => {
    return (
        <div className='product-container'>
            <Link to={`/product/${dashify(product.name)}`}>
                <div className='product-img' />
            </Link>
            <p>{product.name}</p>
            <Link className='red-btn' to={`/product/${dashify(product.name)}`}>View Product</Link>
        </div>
    )
}

export default ProductIndexItem;

export const dashify = name => {
    const newName = name.split(' ').map(word => (word[0].toLowerCase() + word.slice(1).toLowerCase()))
    return newName.join('-');
}