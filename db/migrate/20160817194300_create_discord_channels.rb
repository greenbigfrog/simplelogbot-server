class CreateDiscordChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_channels, id: false do |t|
      t.string :status, null: false
      t.string :name, null: false
      t.integer :channel_id, null: false, limit: 8

      t.timestamps
    end

    add_index :discord_channels, :channel_id, unique: true
  end
end
