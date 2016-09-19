class CommentsController < ApplicationController
	before_action :authenticate_user!
	
  def create
  	@commentable = load_commentable
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: "Your comment was successfully posted."
   	if current_user != @commentable.user
    	Notification.create(recipient:@commentable.user, actor:current_user, action:"commented_on", notifiable:@commentable)
    end
    (load_commentable.users.uniq-[current_user, @commentable.user]).each do |user|
    	Notification.create(recipient: user, actor:current_user, action: "commented", notifiable:@commentable)
    end
  end
  def edit
		@commentable = load_commentable
		@comment = @commentable.comments.find(params[:id])
	end

	def update
		@commentable = load_commentable
		@comment = @commentable.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to @commentable
		else
			render 'edit'
		end
	end

	def destroy
		@commentable = load_commentable
		@comment = @commentable.comments.find(params[:id])
		@comment.destroy
		redirect_to @commentable, notice: "your comment was deleted"
	end
	def upvote
		@commentable = load_commentable
		@comment = @commentable.comments.find(params[:id])
		@comment.upvote_by current_user
		redirect_to :back
	end


  private

    def comment_params
      params.require(:comment).permit(:post)
    end

    def load_commentable
    	params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
    end
end
