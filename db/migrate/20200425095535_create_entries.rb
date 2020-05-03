class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :type
      t.float :ammount
      t.text :description

      t.timestamps
    end
  end
end
