# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  add_flash_types :danger, :info, :warning, :success, :messages

  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::UnknownFormat, with: :page_not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name image description])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username name image description])
  end

  def set_layout
    current_user ? 'application' : 'auth'
  end

  private

  def record_not_found(error)
    flash[:error] = error.message
    redirect_back(fallback_location: root_path)
  end

  def page_not_found(_error)
    flash[:error] = t('page_not_found')
    redirect_back(fallback_location: root_path)
  end
end
