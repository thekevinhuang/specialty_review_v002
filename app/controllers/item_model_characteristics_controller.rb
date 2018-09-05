class ItemModelCharacteristicsController < ApplicationController
    def new
        if params[:item_model_id]
            @item_model = ItemModel.find_by(id: params[:item_model_id])
        else
            redirect_to root_path
        end
    end

    def create

    end

end