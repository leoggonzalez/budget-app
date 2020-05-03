class Account < ApplicationRecord
  validates :name, presence: true

  def total_balance
    entries = self[:set_entries]
    return self[:balance] + entries.sum("ammount")
  end

  private

  def set_entries
    entries = Entry.where(account_id: self[:id])
  end
end
