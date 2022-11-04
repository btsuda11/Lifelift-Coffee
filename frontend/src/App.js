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

  return (
    <>
      {showCart &&
        <CartSideBar showCart={showCart} setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} />} 
      <Header setShowCart={setShowCart} />
      <Switch>
        <Route exact path='/products' component={ProductIndex} />
        <Route exact path='/products/:category' component={ProductIndex} />
        <Route exact path='/product/:productName'>
          <ProductShow setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} />
        </Route>
        <Route exact path='/account' component={Profile} />
        <Route exact path='/account/login' component={LoginPage} />
        <Route exact path='/account/register' component={SignUpPage} />
        <Route exact path='/'>
          <SplashPage showCart={showCart} setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} />
        </Route>
        <Redirect to='/' />
      </Switch>
      <Footer />
    </>
  );
}

export default App;
