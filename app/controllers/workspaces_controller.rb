class WorkspacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workspase, only: %i[show update destroy]

  def index
    @workspaces = current_user.workspaces
  end

  def new
    @workspace = Workspace.new
  end

  def show;end

  def edit;end

  def create
    @workspace = Workspace.new(workspace_params.merge(author: current_user))
    if @workspace.save
      redirect_to @workspace, notice: 'Your workspace successfully created.'
    else
      render :new
    end
  end

  def update
    if @workspace.update(workspace_params)
      redirect_to @workspace, notice: 'Your workspace successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workspace.destroy if current_user == @workspace.author
    redirect_to root_path, notice: 'Workspace was deleted'
  end

  private

  def set_workspase
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:title)
  end
end
