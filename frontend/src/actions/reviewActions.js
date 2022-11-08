import csrfFetch from "../store/csrf";

export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS';
export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW';
export const REMOVE_REVIEW = 'reviews/REMOVE_REVIEW';

const receiveReviews = reviews => (
    { type: RECEIVE_REVIEWS, reviews }
)

const receiveReview = review => (
    { type: RECEIVE_REVIEW, review }
)

const removeReview = reviewId => (
    { type: REMOVE_REVIEW, reviewId }
)

export const getReviews = state => (
    state.entities.reviews ? Object.values(state.entities.reviews) : []
)

export const fetchReviews = productName => async dispatch => {
    const response = await csrfFetch(`/api/products/${productName}/reviews`)
    if (response.ok) {
        const reviews = await response.json();
        dispatch(receiveReviews(reviews));
    }
    return response;
}

export const createReview = review => async dispatch => {
    const response = await csrfFetch('/api/reviews', {
        method: 'POST',
        body: JSON.stringify(review)
    });
    if (response.ok) {
        const review = await response.json();
        dispatch(receiveReview(review));
    }
    return response;
}

export const updateReview = review => async dispatch => {
    const response = await csrfFetch(`/api/reviews/${review.review.id}`, {
        method: 'PATCH',
        body: JSON.stringify(review)
    });
    if (response.ok) {
        const review = await response.json();
        dispatch(receiveReview(review));
    }
    return response;
}

export const deleteReview = reviewId => async dispatch => {
    const response = await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    });
    if (response.ok) {
        dispatch(removeReview(reviewId));
    }
    return response;
}