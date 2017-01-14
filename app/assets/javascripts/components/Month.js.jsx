var Month = React.createClass({
  render: function() {
    let loadDays;
    loadDays = this.props.days.map((day) => {
      return(<tbody key={day.id}>
        <Day day={day} />
      </tbody>)
    })

    return(
      <table>
        <thead>
          <tr>
            <th>Date</th>
            <th>Insured</th>
            <th>Uninsured</th>
          </tr>
        </thead>
        {loadDays}
      </table>
    )
  }
})
