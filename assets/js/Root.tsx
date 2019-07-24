import * as React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import Header from './components/Header'
import Counter from './components/Counter'
import HomePage from './pages'

export default class Root extends React.Component {
  public render(): JSX.Element {
    return (
      <>
        <Header />
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={ HomePage } />
            <Route path="/counter" component={ Counter } />
          </Switch>
        </BrowserRouter>
      </>
    )
  }
}
