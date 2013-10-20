class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :vote_id
      t.integer :question_id
      t.integer :value

      t.timestamps
    end
  end
end
