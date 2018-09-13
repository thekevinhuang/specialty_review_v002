class SessionsController < ApplicationController
    def new
        if !@user
            @user = User.new
        end
    end

    def create
        @user = User.find_by(name: params[:name])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end