class AddColumnsToBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.integer :price
      t.references :owner, references: :users, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
