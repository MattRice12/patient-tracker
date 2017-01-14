var Day = React.createClass({
  getInitialState: function() {
    return {locked: true}
  },

  handleClick: function() {
    this.setState({
      locked: !this.state.locked
    });
  },

  putLock: function(e) {
    var that = this;
  },

  render: function() {
    let currentDay = this.props.day;
    let lockImg;
    let InMinusIcon;
    let UnMinusIcon;
    let plusIcon;
    let insuredBlock;
    let uninsuredBlock;
    let insuredOutput;
    let uninsuredOutput;

    if (currentDay.insureds_count) {
      insuredOutput = <span>{currentDay.insureds_count}</span>
      inMinusIcon = <i className="fa fa-minus-square-o"></i>
    } else {
      insuredOutput = <span>0</span>
      inMinusIcon = <i></i>
    }

    if (currentDay.uninsureds_count) {
      uninsuredOutput = <span>{currentDay.uninsureds_count}</span>
      unMinusIcon = <i className="fa fa-minus-square-o"></i>
    } else {
      uninsuredOutput = <span>0</span>
      unMinusIcon = <i></i>
    }

    plusIcon = <i className="fa fa-plus-square-o"></i>

    if (this.state.locked === true) {
      lockImg = <i className="fa fa-lock"></i>;
      insuredBlock = <span>{insuredOutput}</span>
      uninsuredBlock = <span>{uninsuredOutput}</span>
    } else {
      lockImg = <i className="fa fa-unlock"></i>
      insuredBlock = (
        <span>
          {inMinusIcon}
          {insuredOutput}
          {plusIcon}
        </span>)
      uninsuredBlock = (
        <span>
          {unMinusIcon}
          {uninsuredOutput}
          {plusIcon}
        </span>)
    };

    return(
      <tr>
        <td>
          <div className="lock" onClick={this.handleClick}>{lockImg}</div>
          <span>{currentDay.day_name}</span>
        </td>

        <td>{insuredBlock}</td>
        <td>{uninsuredBlock}</td>
      </tr>
    )
  }
})
