class CharacteristicsController < ApplicationController
    def new
        if params[:item_model_id]
            @item_model = ItemModel.find_by(id: params[:item_model_id])
        end
    end

    def create
        characteristic = Characteristic.new(characteristic_params)
        item_model = ItemModel.find_by(id: params[:parent][:parent_id])
        characteristic.item_model = item_model

        if characteristic.save
            redirect_to characteristic_path(characteristic)        
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