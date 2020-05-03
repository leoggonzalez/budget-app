class Account < ApplicationRecord
  belongs_to :user
  has_many :entries
  validates :name, presence: true

  def total_balance
    entries = self[:set_entries]
    return self[:balance] + self.entries.sum("ammount")
  end
end
