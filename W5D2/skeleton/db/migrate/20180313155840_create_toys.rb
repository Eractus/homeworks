class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name, null: false
      t.integer :toyable_id, null: false
      t.string :toyable_type, null: false

      t.timestamps
    end
    add_index :toys, :name
    add_index :toys, :toyable_id
  end
end
