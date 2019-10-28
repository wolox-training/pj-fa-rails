class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def user_not_authorized(exception)
    render json: { error: exception.message }, status: :unauthorized
  end
end
