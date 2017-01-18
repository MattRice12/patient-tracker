var Adjuster = React.createClass({
  getInitialState: function() {
    return {count: this.props.count, n: 0 }
  },

  createPerson: function() {
    console.log(this.state.count)
    $.ajax({
      url: '/' + this.props.name + '/',
      method: 'POST',
      dataType: 'JSON',
      data: {
        day_id: this.props.day.id
      }
    });
    this.setState({
      count: (this.state.count + 1),
      n: this.state.n + 1
    })
  },

  deletePerson: function() {
    $.ajax({
      method: "DELETE",
      url: "/" + this.props.name + "/" + this.props.obj[this.state.n].id,
      success: function(e) {
        this.setState({
          count: this.state.count - 1,
          n: this.state.n + 1
        })
      }.bind(this),
    })
  },


  render: function() {
    let minusIcon;

    if (this.props.count) {
      minusIcon = <i className="fa fa-minus-square-o"></i>
    } else {
      minusIcon = <i></i>
    }

    return(
      <span>
        <span className="minus" onClick={this.deletePerson}>{minusIcon}</span>
        <span>{this.state.count || 0}</span>
        <span className="plus" onClick={this.createPerson}><i className="fa fa-plus-square-o"></i></span>
      </span>
    )
  }
})
