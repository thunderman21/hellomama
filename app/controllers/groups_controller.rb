class GroupsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	load_and_authorize_resource

	def index
		@groups = Group.all.order("created_at desc")
	end

	def show 
		
	end

	def new
	end

	def edit

	end

	def create
		respond_to do |format|
			@group.user_id =  current_user.id
			 @group.users << current_user
			if @group.save
        format.html { redirect_to @group, notice: 'Your new group was  created succefully' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
		end
	end

	def update
		respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #join a group
  def join
  	respond_to do |format|
	  	@group = Group.find(params[:id])
	  	#@user = User.find(params[:user_id])
	  	@group.users << current_user unless @group.users.include? current_user
	  	if @group.save
  			format.html { redirect_to @group, notice: 'you are now a member of this group' }
  		end
  	end
  end

  #leave a group
  def leave
 	  @group = Group.find(params[:id])
	  @group.users.delete(current_user)
	  redirect_to @group, notice: 'you have left this group'
  end
	
	private
		def group_params
			params.require(:group).permit(:name, :bio, :user_id, :group_id)
		end
end
