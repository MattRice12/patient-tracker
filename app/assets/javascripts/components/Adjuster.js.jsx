var Adjuster = React.createClass({
  getInitialState: function() {
    return {
      count: this.props.count,
      objects: []
    }
  },

  componentWillMount: function() {
    this.updateAdjuster();
  },

  updateAdjuster: function () {
    var that = this;
    $.ajax({
        url: "/days/" + this.props.day.id,
        dataType: "JSON",
        method: "GET"
    }).done(function(response) {
      that.objectCheck(response);
    });
  },

  objectCheck: function(response) {
    if (this.props.name === "insureds") {
      this.setState({
        objects: response.insureds
      })
    } else {
      this.setState({
        objects: response.uninsureds
      })
    }
  },

  parentCount: function() {
    if (this.props.name === "insureds") {
      this.props.parent.setState({
        insured_count: this.state.count
      })
    } else {
      this.props.parent.setState({
        uninsured_count: this.state.count
      })
    }
  },

  createPerson: function() {
    $.ajax({
      url: '/' + this.props.name + '/',
      method: 'POST',
      dataType: 'JSON',
      data: {
        day_id: this.props.day.id
      },
      success: function(e) {
        this.setState({
          count: this.state.count + 1
        })
        this.parentCount()
        this.updateAdjuster()
      }.bind(this)
    })
  },

  deletePerson: function() {
    var lastObject = this.state.objects[this.state.objects.length-1];
    $.ajax({
      method: "DELETE",
      url: "/" + this.props.name + "/" + lastObject.id,
      success: function(e) {
        this.setState({
          count: this.state.count - 1
        })
        this.parentCount()
        this.updateAdjuster()
      }.bind(this)
    });
  },

  render: function() {
    let minusIcon;
    if (this.state.count) {
      minusIcon = <i className="fa fa-minus-square-o" onClick={this.deletePerson}></i>
    } else {
      minusIcon = <i></i>
    }

    return(
      <span>
        <span className="minus">{minusIcon}</span>
        <span>{this.state.count || 0}</span>
        <span className="plus" ><i className="fa fa-plus-square-o" onClick={this.createPerson}></i></span>
      </span>
    )
  }
})
