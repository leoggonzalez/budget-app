class Account < ApplicationRecord
  belongs_to :user
  has_many :entries
  validates :name, presence: true

  # TODO: Rework to accept a date
  def get_month_balance(month)
    entries = self.entries.select {|entry| entry.active_on.month <= month}.map {|e| e[:ammount]}

    # For each recurrent payment we need to multiply monthly 
    totalRecurrent = 0
    today = Date.today
    recurrent = self.entries.select {|entry| entry.recurrent == "Monthly"}
    recurrent.each do |item|
      years = today.year - item.active_on.year
      # Compare agains current month or one month less than end month
      months = [month, item.inactive_on ? item.inactive_on.month - 1 : month].min - item.active_on.month
      if months > 0
        total = years * 12 + months
        totalRecurrent += total * item.ammount 
      end
    end

    return entries.sum + totalRecurrent
  end

  def current_balance
    return self.entries.sum("ammount")
  end
end
