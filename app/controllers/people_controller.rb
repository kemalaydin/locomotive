class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.build_user
  end

  def create
    @person = Person.new(person_params)
    @person.save!
  end

  private
    def person_params
      params.require(:person).permit(:name, :surname, :phone, :age, :gender, :job, user_attributes: [:id, :email, :password, :password_confimation])
    end
end
