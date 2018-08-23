class ItemCategoriesController < ApplicationController

    def new
        if params[:activity_id]
            @activity = Activity.find_by(id: params[:activity_id])
        end
    end

    def create
        
        item_category = ItemCategory.new(item_category_params)
        
        activity = Activity.find_by(id: params[:parent][:parent_id])
        item_category.activity = activity

        if item_category.save
            redirect_to item_category_path(item_category)
        else
            redirect_to new_item_category_path
        end
    end

    def show
        @item_category = ItemCategory.find_by(id: params[:id])
        
    end

    def index

    end

    private

    def item_category_params
        params.require(:item_category).permit(:name, :description)
    end

end