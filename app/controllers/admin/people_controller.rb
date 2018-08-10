class Admin::PeopleController < ApplicationController
    before_action :authenticate_user!, :authenticate_admin
    before_action :get_person, only: [:show, :edit, :update, :destroy]
    layout "panel_layout"
    def index
        @people = User.where(type_type: 'Person')
    end

    def show
    end

    def confirm
        update_status("confirm")
    end
    
    def reject
        update_status("reject")
    end

    private
    def person_param
        #params.require(:person).permit(:title,:partner_type, user_attributes: [ :id, :email ])
    end

    def get_person
        @person = User.find(params[:id])
    end

    def update_status(vote)
        @partner_vote = PartnerVote.where(user_id: params[:id]).where(partner_id: current_user.id).first
        if(vote == "confirm")
            @partner_vote.vote = 1
        else
            @partner_vote.vote = 2
        end
        @partner_vote.save
        @person_votes = PartnerVote.where(user_id: params[:id])
        @percent = 0
        @null_vote = 0
        @person_percent = 100 / @person_votes.count

        @person_votes.each do |vote|
            if(vote.vote == "onaylandi")
                @percent += @person_percent
            elsif(vote.vote == "bekliyor")
                @null_vote += 1
            end
        end
        @user_status = User.find(params[:id])
        if(@percent > 50)
            @user_status.status = 1
            @user_status.save
            @card_create = Card.create(user_id: params[:id])
            #TODO : send mail
        elsif(@null_vote == 0 && @percent < 50)
            @user_status.status = 2
            @user_status.save
            #TODO: send email
        end
        redirect_to admin_person_path(params[:id])
    end
end
