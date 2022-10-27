import { Switch, Route } from 'react-router-dom';
import LoginForm from "./components/account/LoginForm";
import SignUpForm from './components/account/SignUpForm';

function App() {
  return (
    <>
      <h1>Hello from App</h1>
      <Switch>
        <Route exact path='/account/login' component={LoginForm} />
        <Route exact path='/account/register' component={SignUpForm} />
      </Switch>
    </>
  );
}

export default App;
