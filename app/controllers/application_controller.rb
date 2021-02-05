class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_variables, if: :user_signed_in?

  include PublicActivity::StoreController #save current user using gem public_activity

  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end

  private

  def user_not_authorized #pundit
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
