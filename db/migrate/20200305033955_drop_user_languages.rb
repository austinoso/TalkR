class DropUserLanguages < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_languages
  end
end
