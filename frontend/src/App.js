import { Switch, Route, Redirect } from 'react-router-dom';
import { useState } from 'react';
import LoginPage from "./components/account/LoginPage";
import CartSideBar from './components/cart';
import Profile from './components/account/Profile';
import SignUpPage from './components/account/SignUpPage';
import Footer from './components/footer';
import Header from './components/header';
import ProductIndex from './components/products/ProductIndex';
import ProductShow from './components/products/ProductShow';
import SplashPage from './components/splash/SplashPage';

function App() {
  const [showCart, setShowCart] = useState(false);
  const [cartTotal, setCartTotal] = useState(0);

  const closeCart = () => {
    if (showCart) setShowCart(false);
  }

  return (
    <>
      <CartSideBar showCart={showCart} setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} />
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
          <Profile closeCart={closeCart} />
        </Route>
        <Route exact path='/account/login'>
          <LoginPage closeCart={closeCart} />
        </Route>
        <Route exact path='/account/register'>
          <SignUpPage closeCart={closeCart} />
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
