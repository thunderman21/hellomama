class ProfilesController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@diary = @user.diary
	end
	
end
