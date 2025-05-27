# app/controllers/concerns/authenticable.rb
module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  def current_user
    @current_user
  end

  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split.last if header
    decoded = JsonWebToken.decode(token)

    if decoded
      @current_user = User.find_by(id: decoded[:user_id])
    end

    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end
end
