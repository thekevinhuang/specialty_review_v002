class RatingsController <ApplicationController

    def new
        
        if params[:item_model_characteristic_id]
            @item_model_characteristic = ItemModelCharacteristic.find_by(id: params[:item_model_characteristic_id])
        else
            
        end
    end

    def create
        rating = Rating.new(rating_params)

        if rating.save
            redirect_to rating_path(rating)
        else
            redirect_to root_path
        end
    end

    def show
        @rating = Rating.find_by(id: params[:id])
    end

    private

    def rating_params
        params.require(:rating).permit(:rating, :user_id, :characteristic_id, :description)
    end
end