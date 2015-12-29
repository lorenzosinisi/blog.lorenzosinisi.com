class @AboutPage extends React.Component
  @propTypes =
    title: React.PropTypes.string
    body: React.PropTypes.string

  render: ->
    `<div>
      <h1>{this.props.title}</h1>
      <hr />
      <p>{this.props.body}</p>
    </div>`
