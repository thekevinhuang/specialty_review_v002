class CharacteristicsController < ApplicationController

    def new
        if params[:item_model_id]
            @item_model = ItemModel.find_by(id: params[:item_model_id])
            @characteristic = Characteristic.new
        else
            redirect_to root_path
        end
    end

    def create
        @characteristic = Characteristic.find_or_initialize_by(name: characteristic_params[:name])
        
        @characteristic.description = characteristic_params[:description]
        @characteristic.item_model = ItemModel.find_by(id: params[:item_model_id])

        if @characteristic.save
            redirect_to item_model_characteristic_path(@characteristic.item_model,@characteristic)        
        else
            render :new
        end

    end

    def show
        @characteristic = Characteristic.find_by(id: params[:id])
    end

    private

    def characteristic_params
        params.require(:characteristic).permit(:name, :description)
    end
end