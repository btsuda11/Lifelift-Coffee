import { Switch, Route } from 'react-router-dom';
import LoginPage from "./components/account/LoginPage";
import Profile from './components/account/Profile';
import SignUpPage from './components/account/SignUpPage';
import Header from './components/header';
import ProductIndex from './components/products/ProductIndex';

function App() {
  return (
    <>
      <Header />
      <Switch>
        <Route exact path='/products/:category' component={ProductIndex} />
        <Route exact path='/account' component={Profile} />
        <Route exact path='/account/login' component={LoginPage} />
        <Route exact path='/account/register' component={SignUpPage} />
      </Switch>
    </>
  );
}

export default App;
