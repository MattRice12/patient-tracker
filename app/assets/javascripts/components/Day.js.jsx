var Day = React.createClass({
  getInitialState: function() {
    return {
      locked: this.props.day.locked,
      insured_count: this.props.day.insureds,
      uninsured_count: this.props.day.uninsureds
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
      data: {
        days: {
          locked: !this.state.locked
        }
      }
    });
  },

  render: function() {
    let currentDay = this.props.day;
    let date = currentDay.date.substr(8, 10);
    let lockImg;
    let block;

    if (this.state.locked === true) {
      lockImg = <i className="fa fa-lock" onClick={this.handleClick}></i>;
      insuredBlock = <span>{this.state.insured_count || 0}</span>
      uninsuredBlock = <span>{this.state.uninsured_count || 0}</span>
    } else {
      lockImg = <i className="fa fa-unlock" onClick={this.handleClick}></i>

      insuredBlock =   <InsuredAdjuster parent={this} day={currentDay} count={this.state.insured_count}    />;
      uninsuredBlock = <UninsuredAdjuster parent={this} day={currentDay} count={this.state.uninsured_count}  />;
    };

    return(
      <tr>
        <td>
          <span className="lock">{lockImg}</span>
          <span>{date}</span>
        </td>
          <td>{insuredBlock}</td>
          <td>{uninsuredBlock}</td>
        </tr>
    )
  }
})
