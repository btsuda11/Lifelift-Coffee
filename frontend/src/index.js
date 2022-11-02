import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import './index.css';
import App from './App';
import configureStore from './store';
import csrfFetch, { restoreSession } from './store/csrf';
import * as sessionActions from "./actions/sessionActions";
import * as productActions from './actions/productActions';
import sessionReducer from './reducers/sessionReducer';


const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.restoreSession = restoreSession;
  window.sessionActions = sessionActions;
  window.productActions = productActions;
  window.sessionReducer = sessionReducer;
}

const Root = () => {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>
  );
}

const renderApplication = () => {
  ReactDOM.render(
    <React.StrictMode>
      <Root />
    </React.StrictMode>,
    document.getElementById('root')
  )
}

if (
  sessionStorage.getItem('X-CSRFToken') === null || 
  sessionStorage.getItem('currentUser') === null
) {
  store.dispatch(restoreSession()).then(renderApplication);
} else {
  renderApplication();
}