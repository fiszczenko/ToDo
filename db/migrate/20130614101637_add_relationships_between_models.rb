class AddRelationshipsBetweenModels < ActiveRecord::Migration
  def change
	  add_column :tasks, :list_id, :integer, :null => false, :default => "0"
	  add_column :tasks, :user_id, :integer, :null => false, :default => "0"
	  add_column :lists, :user_id, :integer, :null => false, :default => "0"
  end
end
