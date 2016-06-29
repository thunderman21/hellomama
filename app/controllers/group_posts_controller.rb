class GroupPostsController < ApplicationController
	before_action :authenticate_user!
	def create
		@group = Group.find(params[:group_id])
		@group_post = @group.group_post.create(params[:group_post].permit(:post,:pictures))
		@group_post.user_id = current_user.id if current_user
		@group_post.save

		if @group.save
			if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @group_post.picture.create(image: image)
          }
        end
			redirect_to :back
		else
			render 'new'
		end
	end
	def destroy
		@group = Group.find(params[:group_id])
		@group_post = @group.group_post.find(params[:id])
		@group_post.destroy
		redirect_to :back, notice: "your post was deleted"
	end
	private
	def user_belongs_to_group

	end
end
