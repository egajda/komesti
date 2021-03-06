// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import * as React from 'react'
import * as ReactDOM from 'react-dom'
import Root from './Root'

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
ReactDOM.render(<Root />, document.getElementById('react-app'))
