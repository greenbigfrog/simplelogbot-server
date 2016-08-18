class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :display_name, null: false
      t.integer :member_id, null: false
      t.integer :server_id, null: false

      t.timestamps
    end
  end
end
