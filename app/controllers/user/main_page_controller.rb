class User::MainPageController < ApplicationController
  before_action :authenticate_user!
  layout "panel_layout"

  def index
    unless current_user.active?
      return
    end
  end
end