import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'
import Main from '../components/Main'
import { Card, Icon, Image, List } from 'semantic-ui-react'

const shops = [
  ["Newburgh Grill", "/images/steak_oml.jpg"],
  ["Telegraph Grill", "/images/steak_oml.jpg"],
  ["Redford Grill", "/images/steak_oml.jpg"],
  ["Livonia Grill", "/images/steak_oml.jpg"]
]
const D = (props) => (
  <List.Item href="/">
    <Image size="tiny" src={props.image} />
    <List.Content >
      <p>{props.name}</p>
    </List.Content>
  </List.Item>
)
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

export default HomePage
