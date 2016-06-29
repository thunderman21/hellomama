class ApplicationController < ActionController::Base
  #creates a custom layout for devise
  # layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # def layout_by_resource
  #   if devise_controller?
  #     "basic_layout"
  #   else
  #     "application"
  #   end
  # end 

  def randomise
    @random_articles = Article.limit(5).order("RANDOM()")
    @random_users = User.limit(5).order("RANDOM()")
    @random_diarys = Diary.limit(5).order("RANDOM()")
    @random_groups = Group.limit(5).order("RANDOM()")
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end
	  rescue_from CanCan::AccessDenied do |exception|
	  flash[:notice] = "There there be monsters there!"
	  redirect_to :back
	end
end
