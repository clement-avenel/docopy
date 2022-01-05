class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :title
      t.text :description
      t.text :document

      t.timestamps
    end
  end
end