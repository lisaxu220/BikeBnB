class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :renter, references: :users, foreign_key: { to_table: :users }
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
