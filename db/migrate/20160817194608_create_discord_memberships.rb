class CreateDiscordMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_memberships, id: false do |t|
      t.string :status, null: false
      t.string :display_name, null: false
      t.integer :user_id, null: false, limit: 8
      t.integer :server_id, null: false, limit: 8

      t.timestamps
    end

    add_index :discord_memberships, :user_id, unique: true
  end
end
