class CreateRattings < ActiveRecord::Migration[6.0]
  def change
    create_table :rattings do |t|
      t.integer :star, default: 0
      t.references :movies, null: false, foreign_key: true

      t.timestamps
    end
  end
end
