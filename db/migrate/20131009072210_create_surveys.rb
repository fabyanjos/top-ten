class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :tilte
      t.text :description
      t.string :style
      t.references :user

      t.timestamps
    end
  end
end
