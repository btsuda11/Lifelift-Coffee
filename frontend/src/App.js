import { Switch, Route, Redirect } from 'react-router-dom';
import { useState, useEffect } from 'react';
import { fetchCartItems } from './actions/cartItemActions';
import LoginPage from "./components/account/LoginPage";
import CartSideBar from './components/cart';
import Profile from './components/account/Profile';
import SignUpPage from './components/account/SignUpPage';
import Footer from './components/footer';
import Header from './components/header';
import ProductIndex from './components/products/ProductIndex';
import ProductShow from './components/products/ProductShow';
import SplashPage from './components/splash/SplashPage';
import SearchPage from './components/search';
import { useDispatch, useSelector } from 'react-redux';

function App() {
  const [showCart, setShowCart] = useState(false);
  const [cartTotal, setCartTotal] = useState(0);
  const [showCheckoutModal, setShowCheckoutModal] = useState(false);
  const [cartErrors, setCartErrors] = useState([]);
  const dispatch = useDispatch();
  const currentUserId = useSelector(state => state.session.currentUser);

  const closeCart = () => {
    if (showCart) setShowCart(false);
  }

  useEffect(() => {
    setCartErrors([]);
    dispatch(fetchCartItems()).catch(async (res) => {
      let data;
      try {
        // .clone() essentially allows you to read the response body twice
        data = await res.clone().json();
      } catch {
        data = await res.text(); // Will hit this case if the server is down
      }
      if (data?.message) setCartErrors(['Must be logged in to view cart']);
      else if (data) setCartErrors([data]);
      else setCartErrors([res.statusText]);
    });
  }, [dispatch, currentUserId])

  return (
    <>
      <CartSideBar showCart={showCart} setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} closeCart={closeCart} setShowCheckoutModal={setShowCheckoutModal} cartErrors={cartErrors} />
      <Header setShowCart={setShowCart} closeCart={closeCart} />
      <Switch>
        <Route exact path='/products'>
          <ProductIndex closeCart={closeCart} />
        </Route>
        <Route exact path='/products/:category'>
          <ProductIndex closeCart={closeCart} />
        </Route>
        <Route exact path='/product/:productName'>
          <ProductShow setShowCart={setShowCart} closeCart={closeCart} />
        </Route>
        <Route exact path='/account'>
          <Profile closeCart={closeCart} showCheckoutModal={showCheckoutModal} setShowCheckoutModal={setShowCheckoutModal} />
        </Route>
        <Route exact path='/account/login'>
          <LoginPage closeCart={closeCart} />
        </Route>
        <Route exact path='/account/register'>
          <SignUpPage closeCart={closeCart} />
        </Route>
        <Route exact path='/search'>
          <SearchPage closeCart={closeCart} />
        </Route>
        <Route exact path='/'>
          <SplashPage showCart={showCart} setShowCart={setShowCart} closeCart={closeCart} />
        </Route>
        <Redirect to='/' />
      </Switch>
      <Footer closeCart={closeCart} />
    </>
  );
}

export default App;
