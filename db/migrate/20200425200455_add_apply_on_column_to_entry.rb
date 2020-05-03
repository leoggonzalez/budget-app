class AddApplyOnColumnToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :active_on, :datetime
  end
end
