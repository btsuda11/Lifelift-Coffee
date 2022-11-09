import csrfFetch from "../store/csrf";

export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT';
export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS';
export const RECEIVE_FEATURED_PRODUCT = 'products/RECEIVE_FEATURED_PRODUCT';
export const REMOVE_PRODUCTS = 'products/REMOVE_PRODUCTS';

const receiveProduct = payload => (
    { type: RECEIVE_PRODUCT, payload }
)

const receiveProducts = products => (
    { type: RECEIVE_PRODUCTS, products }
)

const receiveFeaturedProduct = payload => (
    { type: RECEIVE_FEATURED_PRODUCT, payload }
)

export const removeProducts = () => (
    { type: REMOVE_PRODUCTS }
)

export const getProducts = state => (
    state.entities.products ? Object.values(state.entities.products) : []
)

export const getProduct = productName => state => (
    state.entities.products[productName] ? state.entities.products[productName] : []
)

export const fetchProducts = (category) => async dispatch => {
    const response = await csrfFetch(`/api/products?category=${category}`);
    if (response.ok) {
        const products = await response.json();
        dispatch(receiveProducts(products));
    }
    return response;
}

export const fetchProduct = productName => async dispatch => {
    const response = await csrfFetch(`/api/products/${productName}`);
    if (response.ok) {
        const product = await response.json();
        dispatch(receiveProduct(product));
    }
    return response;
}

export const fetchFeaturedProduct = productName => async dispatch => {
    const response = await csrfFetch(`/api/products/${productName}`);
    if (response.ok) {
        const product = await response.json();
        dispatch(receiveFeaturedProduct(product));
    }
    return response;
}

export const searchProducts = query => async dispatch => {
    const response = await (csrfFetch(`/api/products/search/${query}`));
    if (response.ok) {
        const products = await response.json();
        dispatch(receiveProducts(products));
    }
    return response;
}