class AddInactiveDateToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :inactive_on, :datetime
    add_column :entries, :recurrent, :string
  end
end
