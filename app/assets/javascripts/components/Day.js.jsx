var Day = React.createClass({
  getInitialState: function() {
    return {locked: this.props.day.locked}
  },

  handleClick() {
    this.setState({
      locked: !this.state.locked
    });
    this.updateDay();
    console.log(this.props.day)
  },

  updateDay: function () {
    $.ajax({
      url: "/days/" + this.props.day.id,
      dataType: "JSON",
      data: {
        days: {
          locked: this.state.locked
        },
      },
      method: "PUT"
    });
  },

  render: function() {
    let currentDay = this.props.day;
    let date = currentDay.date.substr(8, 10);
    let lockImg;
    let block;

    if (this.state.locked === true) {
      lockImg = <i className="fa fa-lock"></i>;
      insuredBlock = <span>{this.props.day.insureds_count || 0}</span>
      uninsuredBlock = <span>{this.props.day.uninsureds_count || 0}</span>
    } else {
      lockImg = <i className="fa fa-unlock"></i>
      insuredBlock =   <Adjuster day={currentDay}
                                 count={currentDay.insureds_count}
                                 obj={currentDay.insureds}
                                 name="insureds" />;
      uninsuredBlock = <Adjuster day={currentDay}
                                 count={currentDay.uninsureds_count}
                                 obj={currentDay.uninsureds}
                                 name="uninsureds" />;
    };

    return(
      <tr>
        <td>
          <span className="lock" onClick={this.handleClick}>{lockImg}</span>
          <span>{date}</span>
        </td>
          <td>{insuredBlock}</td>
          <td>{uninsuredBlock}</td>
        </tr>
    )
  }
})
