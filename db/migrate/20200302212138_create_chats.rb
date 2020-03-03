class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      # primary - user who initiated chat
      t.integer :primary_id
      t.integer :secondary_id

      t.timestamps
    end
  end
end
