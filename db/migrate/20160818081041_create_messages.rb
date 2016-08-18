class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :message_id, null: false
      t.text :content, null: false
      t.timestamp :sent_at, null: false
      t.timestamp :edited_at

      t.timestamps
    end
  end
end
