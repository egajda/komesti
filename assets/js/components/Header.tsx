import * as React from 'react'

const Header: React.FC = () => (
  <header>
  <section className="ui menu">
    <a href="/" className="header item">
      <p className="ui red header">Komesti</p>
    </a>
    <div className="right menu">
      <div className="item">
        <div className="ui action left icon input">
          <i className="search icon" />
          <input type="text" />
          <button className="ui button">Search</button>
        </div>
      </div>
      <div className="item">
        <div className="ui red button"><i className="shop icon" />0</div>
      </div>
    </div>
  </section>
  </header>
)

export default Header
