import { Switch, Route } from 'react-router-dom';
import LoginForm from "./components/account/LoginForm";

function App() {
  return (
    <>
      <h1>Hello from App</h1>
      <Switch>
        <Route exact path='/account/login' component={LoginForm} />
      </Switch>
    </>
  );
}

export default App;
