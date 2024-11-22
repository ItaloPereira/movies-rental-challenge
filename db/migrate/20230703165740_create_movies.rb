class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :genre
      t.float :rating
      t.integer :available_copies, default: 0, null: false

      t.timestamps
    end

    create_table :favorite_movies, id: false do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
    end

    add_index :favorite_movies, [:user_id, :movie_id], unique: true
  end
end
