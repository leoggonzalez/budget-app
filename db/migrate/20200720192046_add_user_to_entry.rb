class AddUserToEntry < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :user
  end
end
