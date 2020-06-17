class GroupsController < ApplicationController
  
  def index
  end
  
  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def create
    @group = Group.new(group_params)
    group_setting('グループを作成しました', :new)

    # if @group.save
    #   redirect_to root_path, notice:'グループを作成しました'
    # else
    #   render :new
    # end
  end
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    group_setting('グループを更新しました', :edit)
    # if @group.save
    #   redirect_to root_path, notice:'グループを更新しました'
    # else
    #   render :edit
    # end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def group_setting(message, view)
    if @group.save
      redirect_to group_messages_path(@group), notice: message
    else
      render view
    end
  end
end
