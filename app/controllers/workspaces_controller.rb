class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = current_user.workspaces
  end

  def new
    @workspace = Workspace.new
  end

  def show
  end

  def create
    @workspace = Workspace.new(workspace_params).merge(author: current_user)
    if @workspace.save
      redirect_to @workspace, notice: 'Your workspace successfully created.'
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title)
  end
end
