class CreateDiscordServers < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_servers do |t|
      t.string :name, null: false
      t.integer :membercount, null: false
      t.integer :server_id, null: false
      t.integer :owner_id, null: false
      t.integer :icon_id, null: false

      t.timestamps
    end
  end
end