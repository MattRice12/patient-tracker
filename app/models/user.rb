class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_calendar

  has_many :months

  def create_calendar
    months = %w(January February March April May June July August September October November December)

    months.each_with_index do |month, i|
      this_month = Month.create!(user_id: User.last.id, name: month)
      month_date = Date.new(2017, i+1)

      month_date.beginning_of_month.upto(month_date.end_of_month).each do |date|
        Day.create!(month_id: this_month.id, date: date)
      end
    end

  end
end
