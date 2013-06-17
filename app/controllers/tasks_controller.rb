class TasksController < ApplicationController
	load_and_authorize_resource

	def create
		@list = List.find(params[:list_id])
		if @list.user_id == current_user.id
			@task = Task.new(params[:task])
			@task.list = @list
			@task.user = current_user
			@task.save
		end
	end

	def done
		task = Task.find(params[:id])
		if @list.user_id == current_user.id
			task.done = true
			task.save!
		end
		render :nothing => true
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		list = List.find(params[:list_id])
		redirect_to list_path(list)
	end
end
