class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, :set_locale
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def set_locale
    if current_user
      I18n.locale = current_user.locale || I18n.default_locale
    else
      super
    end
  end
end
