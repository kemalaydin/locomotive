class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.build_user
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      render 'new'
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :surname, :phone, :age, :gender, :job, user_attributes: [:id, :email, :password, :password_confirmation])
    end
end
