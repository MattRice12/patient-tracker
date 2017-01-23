var InsuredAdjuster = React.createClass({
  getInitialState: function() {
    return {
      count: this.props.count,
      open: false
    }
  },

  updateCount: function(count) {
    this.setState({
      count: count
    })
    this.props.parent.setState({
      insured_count: count
    })
  },

  addPerson: function() {
    $.ajax({
      url: "/days/" + this.props.day.id,
      method: "PUT",
      data: {
        days: {
          insureds: this.state.count + 1
        }
      },
      success: function(response) {
        this.updateCount(response.insureds)
      }.bind(this)
    })
  },

  subtractPerson: function() {
    $.ajax({
      url: "/days/" + this.props.day.id,
      method: "PUT",
      data: {
        days: {
          insureds: this.state.count - 1
        }
      },
      success: function(response) {
        this.updateCount(response.insureds)
      }.bind(this)
    });
  },

  openInput: function() {
    this.setState({
      open: !this.state.open
    });
  },

  handleChange(event) {
    $.ajax({
      url: "/days/" + this.props.day.id,
      method: "PUT",
      data: {
        days: {
          insureds: event.target.value
        }
      },
      success: function(response) {
        this.updateCount(response.insureds)
      }.bind(this)
    })
  },

  handleKeyPress(event) {
    if (event.key === 'Enter') {
      this.setState({
        open: !this.state.open
      })
    }
  },

  render: function() {
    let minusIcon;
    let editor;

    if (this.state.count) {
      minusIcon = <i className="fa fa-minus-square-o" onClick={this.subtractPerson}></i>
    } else {
      minusIcon = <i></i>
    }

    if (this.state.open === true) {
      editor = <span onDoubleClick={this.openInput}>
          <input type="number" autoFocus className="num-input" placeholder={this.state.count} onChange={this.handleChange} onKeyPress={this.handleKeyPress}/>
        </span>
    } else {
      editor = <span>
        <span className="minus">{minusIcon}</span>
        <span onDoubleClick={this.openInput}>{this.state.count}</span>
        <span className="plus"><i className="fa fa-plus-square-o" onClick={this.addPerson}></i></span>
      </span>
    }

    return(
      <span>{editor}</span>
    )
  }
})
