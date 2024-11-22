class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end

    add_index :rentals, [:user_id, :movie_id], unique: true
  end
end