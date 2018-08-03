class Admin::AdminsController < ApplicationController
    before_action :authenticate_user!, :authenticate_admin
    def index

        # @PersonCount = Person.count
        # @PartnerCount = Partner.count
        # @ActivityCount = Activity.count

        @partners = Partner.limit(5).order(created_at: :desc)
        @activities = Activity.limit(5).order(updated_at: :desc)
        @users = User.where(status: 0).where(type_type: 'Person')
    end
end
