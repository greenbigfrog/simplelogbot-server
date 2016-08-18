class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :user_id, null: false
      t.boolean :bot, null: false
      t.string :avatar_id, null: false
      t.integer :discriminator, null: false

      t.timestamps
    end
  end
end
