class PeopleController < ApplicationController
  layout false, only: [:new]
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

  def card_login
    ## LİNK : http://localhost:3000/open/1000003_2312213_entrance
    @qr_code = params[:qr]
    @parse_code = @qr_code.split('_')
    @card_no = @parse_code[0]
    @activity_no = @parse_code[1]
    @login_type = @parse_code[2]

    @login_control = Activity.where(activity_code: @activity_no).where(card_id: @card_no).first
    unless(@login_control)
      render json: ['status' => 404, 'message' => "Böyle giriş izin kaydı bulunamadı"]
    else
      @last_login_control = Activity.where(card_id: @card_no).where.not(activity_type: 3).last
      if(@last_login_control.activity_type != "pending")
        render json: ['status' => 500, 'message' => 'Giriş kodunuz yalnız 1 defaya mahsus çalışır, yeni kod almak için giriş kartı sayfasına gidiniz.']
      elsif(@last_login_control.activity_type == @login_type)
        render json: ['status' => 500, 'message' => 'Aynı işlem yönünden 2 kere işlem yapılamaz.']
      else  
        @login_control.activity_type = @login_type
        @login_control.save
        if(@login_type == "entrance")
          message = "Co-Lab'a Hoş Geldiniz..."
        else
          message = "Görüşmek Üzere..."
        end
        render json: ['status' => 200, 'message' => message]
      end
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :surname, :phone, :age, :gender, :job, user_attributes: [:id, :email, :password, :password_confirmation])
    end
end
