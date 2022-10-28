import { Switch, Route } from 'react-router-dom';
import LoginPage from "./components/account/LoginPage";
import Profile from './components/account/Profile';
import SignUpPage from './components/account/SignUpPage';

function App() {
  return (
    <>
      <h1>Hello from App</h1>
      <Switch>
        <Route exact path='/account' component={Profile} />
        <Route exact path='/account/login' component={LoginPage} />
        <Route exact path='/account/register' component={SignUpPage} />
      </Switch>
    </>
  );
}

export default App;
