class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :renter, references: :users, foreign_key: { to_table: :users }
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
