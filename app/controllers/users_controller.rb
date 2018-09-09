class UsersController < ApplicationController
    before_action :load_user, only: [:show, :edit]

    def new

    end

    def create
        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show

    end

    def index

    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def load_user
        User.find_by(id: params[:id])
    end
end