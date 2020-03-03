class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :pass
      t.string :bio
      t.string :country

      t.timestamps
    end
  end
end
