var UninsuredAdjuster = React.createClass({
  getInitialState: function() {
    return {
      count: this.props.count
    }
  },

  updateCount: function(n) {
    this.setState({
      count: this.state.count + n
    })
    this.props.parent.setState({
      uninsured_count: this.state.count
    })
  },

  addPerson: function() {
    $.ajax({
      url: "/days/" + this.props.day.id,
      method: "PUT",
      data: {
        days: {
          uninsureds: this.state.count + 1
        }
      },
      success: function(e) {
        this.updateCount(1)
      }.bind(this)
    })
  },

  subtractPerson: function() {
    $.ajax({
      url: "/days/" + this.props.day.id,
      method: "PUT",
      data: {
        days: {
          uninsureds: this.state.count - 1
        }
      },
      success: function(e) {
        this.updateCount(-1)
      }.bind(this)
    });
  },

  render: function() {
    let minusIcon;
    if (this.state.count) {
      minusIcon = <i className="fa fa-minus-square-o" onClick={this.subtractPerson}></i>
    } else {
      minusIcon = <i></i>
    }

    return(
      <span>
        <span className="minus">{minusIcon}</span>
        <span>{this.state.count || 0}</span>
        <span className="plus" ><i className="fa fa-plus-square-o" onClick={this.addPerson}></i></span>
      </span>
    )
  }
})
