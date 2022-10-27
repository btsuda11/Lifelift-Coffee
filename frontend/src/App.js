import { Switch, Route } from 'react-router-dom';
import LoginFormPage from "./components/account/LoginFormPage";
import Profile from './components/account/Profile';
import SignUpForm from './components/account/SignUpForm';

function App() {
  return (
    <>
      <h1>Hello from App</h1>
      <Switch>
        <Route exact path='/account' component={Profile} />
        <Route exact path='/account/login' component={LoginFormPage} />
        <Route exact path='/account/register' component={SignUpForm} />
      </Switch>
    </>
  );
}

export default App;
