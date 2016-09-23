class CreateDiscordUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_users, id: false do |t|
      t.string :status, null: false
      t.string :username, null: false
      t.integer :user_id, null: false, limit: 8
      t.boolean :bot, null: false, default: false
      t.string :avatar_id, limit: 8
      t.integer :discriminator, null: false

      t.timestamps
    end

    add_index :discord_users, :user_id, unique: true
  end
end
