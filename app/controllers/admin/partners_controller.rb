class Admin::PartnersController < ApplicationController
    before_action :authenticate_user!, :authenticate_admin
    before_action :get_partner, only: [:show, :edit, :update, :destroy]

    def index
        @partners = Partner.all
    end

    def new
        @partner = Partner.new
        @partner.build_user
    end

    def create
        @partner_password = Devise.friendly_token.first(8)
        #TODO : Partner email gönderme işlemi yapılacak.
        puts "#########################"
        puts @partner_password
        @partner = Partner.new(partner_params)
        @partner.user.password = @partner_password
        @partner.user.password_confirmation = @partner_password
        if(@partner.save)
            redirect_to admin_partner_path(@partner)
        else
            render 'new'
        end
    end

    def update
        if(@partner.update(partner_params))
            redirect_to admin_partner_path(@partner)
        else
            render 'edit'
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @partner.destroy
        redirect_to admin_partners_path()
    end


    private
    def partner_params
        params.require(:partner).permit(:title,:partner_type, user_attributes: [ :id, :email ])
    end

    def get_partner
        @partner = Partner.find(params[:id])
    end
end
