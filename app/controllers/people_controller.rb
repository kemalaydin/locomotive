class PeopleController < ApplicationController
  #TODO
  require 'securerandom'
  require 'rqrcode'
  def new
    @person = Person.new
    @person.build_user
  end

  def create
    @person = Person.new(person_params)
    @reference_text = ReferenceText.new(text: params[:reference][:text], user: @person.user)
    if params[:reference][:code] != ""
      @reference_code = ReferenceCode.find_by(reference_code: params[:reference][:code])
      if @reference_code && @reference_code.unused? && @reference_code.email == @person.user.email
        @reference_code.used!
        @reference_text.reference_code = @reference_code
      else
        #TODO flash error
        puts 'Invalid code'
        redirect_to new_person_path
        return
      end
    end
    @person.user.reference_text = @reference_text
    if @person.save
      redirect_to user_path
      return
    else
      redirect_to new_person_path
      return
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :surname, :phone, :age, :gender, :job, user_attributes: [:id, :email, :password, :password_confirmation])
    end
end
