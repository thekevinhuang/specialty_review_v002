class ActivitiesController < ApplicationController
    def show

    end

    def new

    end

    def create
        activity = Activity.new(activity_params)

        if activity.save
            redirect_to activity_path(activity)
        else
            redirect_to new_activity_path
        end
    end

    def destroy

    end

    def index
        @activities = Activity.all
        
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description)
    end
end