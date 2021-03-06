class CreateDiscordMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :discord_memberships, id: false do |t|
      t.string :status, null: false
      t.string :display_name, null: false
      t.integer :member_id, null: false, limit: 8
      t.integer :server_id, null: false, limit: 8

      t.timestamps
    end

    add_index :discord_memberships, :member_id, unique: true
  end
end
