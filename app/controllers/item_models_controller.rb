class ItemModelsController <ApplicationController
    def show

    end

    def new
        if params[:item_category_id]
            @item_category = Activity.find_by(id: params[:item_category_id])
        end
    end

    def create

    end
end