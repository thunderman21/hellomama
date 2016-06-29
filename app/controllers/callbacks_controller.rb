class CallbacksController < Devise::OmniauthCallbacksController
	#facebook omniauth callback
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
  #twitter omniauth callback
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
  #google omniauth callback
  def google
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end