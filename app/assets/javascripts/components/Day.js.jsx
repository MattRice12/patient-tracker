var Day = React.createClass({
  getInitialState: function() {
    return {
      locked: this.props.day.locked,
      insured_count: this.props.day.insureds_count,
      uninsured_count: this.props.day.uninsureds_count,
      insured: this.props.day.insureds,
      uninsured: this.props.day.uninsureds
    }
  },

  handleClick() {
    this.setState({
      locked: !this.state.locked
    });
    this.updateDay();
  },

  updateDay: function () {
    $.ajax({
      url: "/days/" + this.props.day.id,
      method: "PUT",
      dataType: "JSON",
      data: {
        days: {
          locked: this.state.locked
        },
      }
    });
  },

  render: function() {
    let currentDay = this.props.day;
    let date = currentDay.date.substr(8, 10);
    let lockImg;
    let block;

    if (this.state.locked === true) {
      lockImg = <i className="fa fa-lock"></i>;
      insuredBlock = <span>{this.state.insured_count || 0}</span>
      uninsuredBlock = <span>{this.state.uninsured_count || 0}</span>
    } else {
      lockImg = <i className="fa fa-unlock"></i>

      insuredBlock =   <Adjuster parent={this} day={currentDay} count={this.state.insured_count}  name="insureds"  />;
      uninsuredBlock = <Adjuster parent={this} day={currentDay} count={this.state.uninsured_count}  name="uninsureds"  />;
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
