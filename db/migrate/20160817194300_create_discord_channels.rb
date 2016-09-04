class CreateDiscordChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_channels do |t|
      t.string :name, null: false
      t.integer :channel_id, null: false

      t.timestamps
    end
  end
end