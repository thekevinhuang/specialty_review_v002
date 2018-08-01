class Activities_Controller < ApplicationController
    def show

    end

    def new

    end

    def create

    end

    def destroy

    end

    def index

    end

    private

    def activity_params
        params.require(:activities).permit(:name, :description)
    end
end