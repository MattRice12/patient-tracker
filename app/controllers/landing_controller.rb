class LandingController < ApplicationController
  def month
    month = current_user.current_month
    render template: "months/show.html.erb", locals: {month: month}
  end
end
