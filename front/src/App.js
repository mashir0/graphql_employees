import React from "react";
import styles from './App.module.css';
import { ApolloProvider } from "@apollo/react-hooks";
import { ApolloClient, InmemoryCache } from "@apollo/client";
import { Router, BrowserRouter, Switch } from "react-router-dom";
import Auth from "./components/Auth";
import MainPage from "./components/MainPage"; 

const client = new ApolloClient({
  uri: "http://127.0.0.1:8000/graphql",
  headers: {
    authorization: localStorage.getItem("token") 
      ? `JWT ${localStorage.getItem("token")}`
      : "",
  },
  cache: new InmemoryCache(),
})

function App() {
  return (
    <ApolloProvider client={client}>
      <div className={styles.app}>
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={Auth}/>
            <Route exact path="/empoloyees" component={MainPage}/>
          </Switch>
        </BrowserRouter>
      </div>
    </ApolloProvider>
  );
}

export default App;
