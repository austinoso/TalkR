class AddCodeToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :code, :string
  end
end
