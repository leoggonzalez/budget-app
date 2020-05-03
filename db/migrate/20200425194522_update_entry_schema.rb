class UpdateEntrySchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :entry_type
    add_reference :entries, :account
  end
end
