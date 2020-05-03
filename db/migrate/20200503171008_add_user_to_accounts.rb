class AddUserToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :accounts, :user
  end
end
