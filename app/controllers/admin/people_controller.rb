class Admin::PeopleController < ApplicationController
    before_action :authenticate_user!, :authenticate_admin
    before_action :get_person, only: [:show, :edit, :update, :destroy]

    def index
        @people = User.where(type_type: 'Person')
    end

    def show
        console
    end

    private
    def person_param
        #params.require(:person).permit(:title,:partner_type, user_attributes: [ :id, :email ])
    end

    def get_person
        @person = User.find(params[:id])
    end
end
