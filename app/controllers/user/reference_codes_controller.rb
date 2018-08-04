class Admin::ReferenceCodesController < ApplicationController
  require 'securerandom'
  before_action :authenticate_user!
  def new
    @reference_code = ReferenceCode.new
  end

  def index
    @reference_codes = ReferenceCode.where(issuer_id: current_user.id)
  end

  def destroy
    @reference_code = ReferenceCode.find(params[:id])
    if @reference_code.issuer == current_user
      @reference_code.destroy
    end
  end

  def create
    @reference_code = ReferenceCode.new(params)
    @reference_code.issuer = current_user
    @reference_code.reference_code = SecureRandom.alphanumeric
    @reference_code.save!
  end

  private
    def reference_code_params
      params.require(:reference_code).permit(:email)
    end
end
