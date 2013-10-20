class AddEndDateUrlToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :end_date, :timestamp
    add_column :surveys, :url, :string
    add_column :surveys, :end_qty_votes, :integer
    add_column :surveys, :closed, :boolean
  end
end
