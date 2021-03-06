class CarsController < ApplicationController
	
	def index
		@cars = Car.all

		@carsOwner = Car.joins(:user).select("users.id as user_id, cars.name, cars.id")
	end


	def new
		@cars = Car.new
	end

	def edit
		@car = Car.find(params[:id])
	end

	def create
		@car = Car.new(car_params)

		if @car.save
			flash[:success] = "Car was successfully created"
			redirect_to users_path
		else
			render 'new'
		end
	end

	def update
		@car = Car.find(params[:id])
		if @car.update(car_params)
			flash[:notice] = "car information Updated!"
			redirect_to cars_path
		else
			flash[:error] = "Failed to update!"
			render 'edit'
		end
	end

	def show
		@car = Car.find(params[:id])
	end

	def destroy
		@car = Car.find(params[:id])
		if @car.delete
			flash[:notice] = "Car Deleted!"
			redirect_to cars_path
		else
			flash[:error] = "Failed to delete this Car!"
			render 'destroy'
		end
	end


	private

		def car_params
			params.require(:car).permit(:name, :user_id)
		end
	
end
