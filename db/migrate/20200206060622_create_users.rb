class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.integer :role, default: 0
      t.string :activation_digest
      t.boolean :is_activated, default: false
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.string :phone
      t.string :gender
      t.date :birthday
      t.string :city

      t.timestamps
    end
  end
end
