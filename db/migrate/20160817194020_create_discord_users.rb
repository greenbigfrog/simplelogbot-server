class CreateDiscordUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_users do |t|
      t.string :status, null: false
      t.string :username, null: false
      t.integer :user_id, null: false, limit: 8
      t.boolean :bot, null: false
      t.string :avatar_id, null: false, limit: 8
      t.integer :discriminator, null: false

      t.timestamps
    end
  end
end
