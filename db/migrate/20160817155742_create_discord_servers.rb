class CreateDiscordServers < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_servers, id: false do |t|
      t.string :status, null: false
      t.string :name, null: false
      t.integer :membercount, null: false
      t.integer :server_id, null: false, limit: 8
      t.integer :owner_id, null: false, limit: 8
      t.integer :icon_id, limit: 8

      t.timestamps
    end

    add_index :discord_servers, :server_id, unique: true
  end
end
