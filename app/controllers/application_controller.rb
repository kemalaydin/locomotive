class ApplicationController < ActionController::Base
    
    def authenticate_admin     
        redirect_to(new_user_session_path) unless current_user.type_type == "Admin"  
    end

    def authenticate_person
        redirect_to(new_user_session_path) unless current_user.type_type == "Person"  
    end

    def authenticate_partner     
        redirect_to(new_user_session_path) unless current_user.type_type == "Partner"  
    end

    def password_generate
        Devise.friendly_token.first(8)
    end


end
