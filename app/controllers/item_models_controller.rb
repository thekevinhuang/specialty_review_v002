class ItemModelsController < ApplicationController

    def show
        @item_model = ItemModel.find_by(id: params[:id])
    end

    def new
        if params[:item_category_id]
            @item_category = ItemCategory.find_by(id: params[:item_category_id])
        else
            
        end
    end

    def create
        item_model = ItemModel.new(item_model_params)
        item_category = ItemCategory.find_by(id: params[:parent][:parent_id])
        item_model.item_category = item_category

        if item_model.save
            redirect_to item_category_item_model_path(item_category, item_model)
        else
            redirect_to new_item_model_path
        end
    end

    private

    def item_model_params
        params.require(:item_model).permit(:name, :description)
    end
end