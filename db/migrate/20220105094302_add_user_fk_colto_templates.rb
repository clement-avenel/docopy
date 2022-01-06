class AddUserFkColtoTemplates < ActiveRecord::Migration[7.0]
  def change
    add_reference :templates, :user, foreign_key: true
  end
end
