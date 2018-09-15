class SessionsController < ApplicationController
    def new
        
    end

    def create
        if !auth['uid'].empty?
            @user = User.find_or_create_by(email: 'blah')
        else


            @user = User.find_by(name: params[:name])

            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "There was an error authenticating, please doublecheck your info and try again."
                render :new
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def authorize
        request.env['omniauth.auth']
    end
end