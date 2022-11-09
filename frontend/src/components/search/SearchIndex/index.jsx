import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useLocation } from 'react-router-dom';
import { getProducts, removeProducts, searchProducts } from '../../../actions/productActions';
import ProductIndexItem from '../../products/ProductIndex/ProductIndexItem';
import SearchPage from '../index';
import './SearchIndex.css';

const SearchIndex = ({ closeCart }) => {
    const products = useSelector(getProducts);
    const dispatch = useDispatch();
    const location = useLocation();
    const { query } = location.state || {};

    useEffect(() => {
        dispatch(searchProducts(query));
        // return () => dispatch(removeProducts());
    }, [dispatch, query])

    if (Array.isArray(products[0])) return null;

    return (
        <>
            <SearchPage closeCart={closeCart}/>
            <section onClick={closeCart} className='search-results'>
                {products.length === 0 ?
                    <p>Your search for "{query}" did not yield any results</p> :
                    <>
                        <p>Your Search term <span className='bold'>{query}</span> has {products.length} results</p>
                        <div className='product-grid'>
                            {products.map(product => (<ProductIndexItem key={product.id} product={product} search={true} />))}
                        </div>
                    </>
                }
            </section>
        </>
    )
}

export default SearchIndex;