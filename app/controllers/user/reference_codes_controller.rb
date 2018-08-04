class User::ReferenceCodesController < ApplicationController
  require 'securerandom'
  before_action :authenticate_user!
  def new
    unless current_user.active?
      return
    end
    @reference_code = ReferenceCode.new
  end

  def index
    unless current_user.active?
      return
    end
    @reference_codes = ReferenceCode.where(issuer_id: current_user.id)
  end

  def destroy
    unless current_user.active?
      return
    end
    @reference_code = ReferenceCode.find(params[:id])
    if @reference_code.issuer == current_user
      @reference_code.destroy
    end
  end

  def create
    unless current_user.active?
      return
    end
    @reference_code = ReferenceCode.new(reference_code_params)
    @reference_code.issuer = current_user
    @reference_code.reference_code = SecureRandom.alphanumeric
    @reference_code.save!
  end

  private
    def reference_code_params
      params.require(:reference_code).permit(:email)
    end
end
