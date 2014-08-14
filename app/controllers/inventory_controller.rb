class InventoryController < ApplicationController

	def index
		@inventory = Inventory.all
	end

	def new
		@inventory = Inventory.new
	end

	def create
		@inventory = Inventory.new(inventory_params)

		if @inventory.save
			redirect_to @inventory, notice: "This is supply ##{ @inventory.id}"
		else
			render 'new'
		end
	end

	def edit
		@inventory = Inventory.find(params[:id])
	end

	def update
		@inventory = Inventory.find(params[:id])

		if @inventory.update(inventory_params)
			redirect_to @inventory
		else
			render 'edit'
		end
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

	def destroy
		@inventory = Inventory.find(params[:id])
		@inventory.destroy

		redirect_to inventory_index_path
	end

private
	def inventory_params
		params.require(:inventory).permit(:description, :printer_id, :location_id, :inventory_type_id, :printer_model_id)
	end
end
