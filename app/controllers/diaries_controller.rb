class DiariesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource

	# GET /Diaries
	# GET /Diaries.json
	def index
		@diaries = Diary.all
	end

	#GET /diaries/1
	#GET /diaries/1.json
	def show
	end

	#GET /diaries/new
	def new
	end

	#GET /diaries/1/edit
	def edit
	end

	#POST /diaries
	#POST /diaries.json
	def create
		respond_to do |format|
			@diary.user_id = current_user.id
			if @diary.save
				format.html { redirect_to @diary, notice: 'Diary was successfully created'}
				format.json { render :show, status: :created, location: @article}
			else
				format.html { render :new }
				format.json { render json: @diary.errors, status: :unprocessable_entity }
			end
		end
	end

	#PATCH/PUT /diaries/1
	#PATCH/PUT /diaries/1.json
	def update
		respond_to do |format|
			if @diary.update(diary_params)
				format.html { redirect_to @diary, notice: 'Your diary was successfully updated'}
				format.json  { render :show, status: :ok, location: @diary }
			else
				format.html { render :edit }
				format.json { render json: @diary.errors, status: :unprocessable_entity }
			end
		end
	end

	#DELETE /diaries/1
	#DELETE /diaries/1.json
	def destroy
		@diary.destroy
		respond_to do |format|
			format.html { redirect_to diaries_url, notice: 'Diary was successfully deleted' }
			format.json { hea :no_content }
		end
	end
	def upvote
    @diary.upvote_by current_user
    redirect_to :back
  end

	private
		#define the white listed parameters
		 def diary_params
		 	params.require(:diary).permit(:post, :user_id)
		 end

end

