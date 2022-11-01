import './ProductIndexItem.css';

const ProductIndexItem = ({ product }) => {
    return (
        <h3>{product.name}</h3>
    )
}

export default ProductIndexItem;