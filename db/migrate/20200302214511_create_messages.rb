class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :chat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
