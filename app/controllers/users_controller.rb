class UsersController < ApplicationController

	def index
		@users = User.all	
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User Saved"
			redirect_to users_path(@user)
		else
			flash[:error] = "Failded to save!"
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "User Updated!"
			redirect_to users_path
		else
			flash[:error] = "Failed to update!"
			render 'edit'
		end
	end 	

	def destroy
		@user = User.find(params[:id])
		if @user.delete
			flash[:notice] = "Product Deleted!"
			redirect_to users_path
		else
			flash[:error] = "Failed to delete this User!"
			render 'destroy'
		end
	end

	def show
		@user = User.find(params[:id])
	end


	private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end
