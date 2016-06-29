class RelationshipsController < ApplicationController
   def follow_user
   	#search by user_id
    @user = User.find(params[:user_id])
    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unfollow_user
  	#search by user id
    @user = User.find(params[:user_id])
    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end
end
