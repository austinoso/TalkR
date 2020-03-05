class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer "contact_id"
      t.integer "contacted_id"

      t.timestamps
    end
  end
end
