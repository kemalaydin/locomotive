class HomeController < ApplicationController
    layout false
    def index
        
    end

    def redirect
        if(user_signed_in?)
            if(current_user.type_type == "Admin")
                redirect_to admin_path()
            elsif(current_user.type_type == "Partner")
                redirect_to partner_path()
            else
                redirect_to user_path()
            end
        else
            redirect_to :root 
        end
    end
end
