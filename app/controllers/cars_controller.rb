class CarsController < ApplicationController
	def index
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def show
	end

	def destroy
	end

	private

	def set_car
		@car = Car.find(params[:id])
	end

	def car_params
		params.require(:car).permit(:name)
	end
end
