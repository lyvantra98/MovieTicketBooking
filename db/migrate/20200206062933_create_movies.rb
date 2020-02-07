class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.float :price
      t.string :info
      t.text :description
      t.string :trailer
      t.string :picture
      t.integer :length_minute
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
