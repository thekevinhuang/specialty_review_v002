class RatingsController <ApplicationController

    def new
        if params[:characteristic_id]
            @characteristic = Characteristic.find_by(id: params[:characteristic_id])
        else
            redirect_to root_path
        end
        @user = current_user
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