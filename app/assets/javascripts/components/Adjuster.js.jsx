var Adjuster = React.createClass({
  getInitialState: function() {
    return {count: this.props.count, objects: this.props.obj, n: 0 }
  },

  updateAdjuster: function () {
    var that = this;
    $.ajax({
        url: "/days/" + this.props.day.id,
        dataType: "JSON",
        method: "GET"
    }).done(function(response) {
      that.setState({
        objects: response.insureds
      })
    });
  },

  createPerson: function() {
    // var that = this;
    $.ajax({
      url: '/' + this.props.name + '/',
      method: 'POST',
      dataType: 'JSON',
      data: {
        day_id: this.props.day.id
      },
      success: function(e) {
        this.setState({
          count: this.state.count + 1,
          n: this.state.n + 1
        }),
        this.props.parent.setState({
          insured_count: this.state.count
        })
      }.bind(this)
    })
    // .done(function(response) {
    //   that.setState({
    //     count:   that.state.count + 1,
    //     objects: that.state.objects.push(response)
    //   })
    // });
    // console.log(this.state.objects)
    this.updateAdjuster();
  },

  deletePerson: function() {
    $.ajax({
      method: "DELETE",
      url: "/" + this.props.name + "/" + this.state.objects[this.state.n].id,
      success: function(e) {
        this.setState({
          count: this.state.count - 1,
        }),
        this.props.parent.setState({
          insured_count: this.state.count
        })
      }.bind(this)
    })
    this.updateAdjuster();
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
