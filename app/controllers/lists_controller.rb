class ListsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show]
	load_and_authorize_resource
	
	def index
		@lists = List.all
	end

	def show
		@list = List.find(params[:id])
	end

	def new
		@list = current_user.lists.new
	end

	def edit
		@list = List.find(params[:id])
	end

	def create
		@list = current_user.lists.build(params[:list])

		if @list.save
			redirect_to @list, notice: 'List was successfully created.'
		else
			render action: "new"
		end
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			redirect_to @list, notice: 'List was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy

		redirect_to lists_url
	end
end
