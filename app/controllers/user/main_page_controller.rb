class User::MainPageController < ApplicationController
  before_action :authenticate_user!
  def index
    unless current_user.active?
      return
    end
  end
end