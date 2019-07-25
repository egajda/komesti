import * as React from 'react'
import { Link } from 'react-router-dom'

import Main from '../components/Main'
import { Card, Icon, Image, List } from 'semantic-ui-react'

interface ApiResponse {
  data: Eatery[];
}

interface Eatery {
  id: number
  name: string
}

interface FetchDataState {
  eateries: Eatery[]
  loading: boolean
}
  const C = (props) => (
    <Card fluid href="/counter">
      <Card.Content header={props.name} />
      <Card.Content description='American, Breakfast, Diner' />
      <Card.Content extra>
        $100 Minimum Order
      </Card.Content>
    </Card>
  )

  const HomePage: React.FC<RouteComponentProps> = () => (
    <Main>
        <div className="ui container grid text">
        <div className="ui stackable two column grid">
        <div className="column">
        </div>
        <h1>All restaurants</h1>
    {shops.map((arr) =>
        <C name={arr[0]} image={arr[1]} />
    )}
    </div>
    </div>
    </Main>
  )

export default class RestaurantsPage extends React.Component<
  {},
  FetchDataState
> {
  constructor(props: {}) {
    super(props)
    this.state = { eateries: [], loading: true }

    fetch('/api/eateries')
      .then(response => response.json() as Promise<ApiResponse>)
      .then(data => {
        this.setState({ eateries: data.data, loading: false })
    })
  }


  private static renderEateries(eateries: Eatery[]) {
    return (
      <div>
          {eateries.map(eatery => (
            <C key={eatery.id} name={eatery.name} />
          )) }
      </div>
    )
  }

  public render(): JSX.Element {
    const content = this.state.loading ? (
      <p>
        <em>Loading...</em>
      </p>
    ) : (
      RestaurantsPage.renderEateries(this.state.eateries)
    )

    return (
      <Main>
        <div className="ui container grid text">
        <div className="ui stackable two column grid">
        <div className="column">
        <h1>All Restaurants</h1>
      { content }
      </div>
      </div>
      </div>
      <br />
      </Main>
    )
  }
}
