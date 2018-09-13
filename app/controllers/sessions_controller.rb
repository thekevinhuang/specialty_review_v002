class SessionsController < ApplicationController
    def new
        
    end

    def create
        @user = User.find_by(name: params[:name])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "There was an error authenticating, please doublecheck your info and try again."
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end