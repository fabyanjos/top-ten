class RenameTilteToTitle < ActiveRecord::Migration
  def up
  	rename_column :surveys, :tilte, :title
  	rename_column :questions, :tilte, :title
  end

  def down
  	rename_column :surveys, :title, :tilte
  	rename_column :questions, :title, :tilte
  end
end
