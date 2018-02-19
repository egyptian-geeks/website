class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_page_number

  private

  def set_page_number
    params[:page] = params[:page].present? ? params[:page].to_i : 1
  end
end
