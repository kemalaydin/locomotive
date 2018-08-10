class User::CardsController < ApplicationController
  before_action :authenticate_user!
  layout "panel_layout"

  def card
    unless current_user.active?
      return
    end
    @card = current_user.card
    @activity = @card.activities.last

    unless @activity && @activity.pending?
      @activity = @card.activities.build
      @activity.activity_code = SecureRandom.alphanumeric
      @activity.activity_type = :pending
      @activity.save!
    end

    @qr_data = "#{@card.id}_#{@activity.activity_code}"
    @qrcode = RQRCode::QRCode.new(@qr_data).as_svg(offset: 0, color: '000',
                    shape_rendering: 'crispEdges',
                    module_size: 11)
  end
end
