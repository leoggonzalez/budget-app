class Entry < ApplicationRecord
  validates :ammount, presence: true
  
  def estimate(month)
    active_month = self[:active_on].mon
    inactive_month = self[:inactive_on] && self[:inactive_on].mon

    if (month == active_month)
      return self[:ammount]
    else
      if (self[:recurrent] == "Monthly" && month >= active_month)
        if (inactive_month)
          if (month <= inactive_month)
            return self[:ammount]
          else
            return nil
          end
        end
        return self[:ammount]
      end
    end
    return nil
  end
end
