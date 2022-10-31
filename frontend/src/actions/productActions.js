import csrfFetch from "../store/csrf";

export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT';
export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS';

const receiveProduct = payload => (
    { type: RECEIVE_PRODUCT, payload }
)

const receiveProducts = products => (
    { type: RECEIVE_PRODUCTS, products }
)

export const getProducts = state => (
    state.products ? Object.values(state.products) : []
)

export const getProduct = productId => state => (
    state.products ? state.products[productId] : null
)

export const fetchProducts = () => async dispatch => {
    const response = await csrfFetch('/api/products');
    if (response.ok) {
        const products = await response.json();
        dispatch(receiveProducts(products));
    }
}

export const fetchProduct = productId => async dispatch => {
    const response = await csrfFetch(`/api/products/${productId}`);
    if (response.ok) {
        const product = await response.json();
        dispatch(receiveProduct(product));
    }
}