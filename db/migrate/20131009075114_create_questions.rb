class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :tilte
      t.text :help
      t.references :survey

      t.timestamps
    end
  end
end
