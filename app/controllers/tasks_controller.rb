class TasksController < ApplicationController
	load_and_authorize_resource
	def create
		@list = List.find(params[:list_id])
		@task = Task.new(params[:task])
		@task.list = @list
		@task.user = current_user
		@task.save
		redirect_to list_path(@list)
	end
end
