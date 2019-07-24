import * as React from 'react'
import { Link } from 'react-router-dom'

import Main from '../components/Main'

interface CounterState {
  currentCount: number
}

const initialState = { currentCount: 0 }

export default class CounterPage extends React.Component<{}, CounterState> {
  constructor(props: {}) {
    super(props)

    this.state = initialState
  }

  public render(): JSX.Element {
    return (
      <Main>
        <h1>Counter</h1>
        <p>Simple example</p>
        <p>
          Current count: <strong>{this.state.currentCount}</strong>
        </p>
        <button className="button" onClick={this.incrementCounter}>
          Increment Counter
        </button>{' '}
        <button className="button button-outline" onClick={this.decrementCounter}>
          Decrement Counter
        </button>{' '}
        <button className="button button-clear" onClick={this.resetCounter}>
          Reset Counter
        </button>
        <br />
        <br />
      </Main>
    )
  }

  private incrementCounter = () => {
    this.setState({
      currentCount: this.state.currentCount + 1
    })
  }

  private decrementCounter = () => {
    this.setState({
      currentCount: this.state.currentCount - 1
    })
  }

  private resetCounter = () => {
    this.setState({
      currentCount: 0
    })
  }
}
