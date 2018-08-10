class Admin::ActivitiesController < ApplicationController
    before_action :authenticate_user!, :authenticate_admin
    layout "panel_layout"
    def index
        @q = Activity.ransack(params[:q])
        @activities = @q.result(distinct: true)
    end
end
