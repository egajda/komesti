import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'
import Main from '../components/Main'

import { Card, Icon, Image } from 'semantic-ui-react'

const shops = [
  ["Newburgh Grill", "/images/steak_oml.jpg"],
  ["Telegraph Grill", "/images/steak_oml.jpg"],
  ["Redford Grill", "/images/steak_oml.jpg"],
  ["Livonia Grill", "/images/steak_oml.jpg"]
]
const C = (props) => (
  <Card href="/counter">
    <Image src={props.image} />
    <Card.Content header={props.name} />
    <Card.Content description='American, Breakfast, Diner' />
    <Card.Content extra>
      $100 Minimum Order
    </Card.Content>
  </Card>
)
const HomePage: React.FC<RouteComponentProps> = () => (
  <Main>
  <div className="ui container">
  {shops.map((arr) =>
    <C name={arr[0]} image={arr[1]} />
  )}
  </div>
  </Main>
)

export default HomePage
