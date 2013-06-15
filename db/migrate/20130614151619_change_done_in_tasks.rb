class ChangeDoneInTasks < ActiveRecord::Migration
  def up
	  change_column :tasks, :done, :boolean, :null => false, :default => 0
  end
end
