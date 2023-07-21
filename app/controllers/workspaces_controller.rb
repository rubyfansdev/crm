class WorkspacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workspase, only: %i[show update destroy]

  def index
    @workspaces = workspaces
  end

  def new
    @workspace = Workspace.new
  end

  def show;end

  def edit;end

  def create
    @workspace = Workspace.new(workspace_params.merge(author: current_user))
    respond_to do |format|
      if @workspace.save
        format.turbo_stream do
          render turbo_stream: [turbo_stream.update('workspaces',
                                                    partial: 'workspaces/workspaces',
                                                    locals: { :workspaces => workspaces }),
                                                    turbo_stream.update('notice',
                                                    'Your workspace successfully created.')]

        end
        format.html { redirect_to @workspace, notice: 'Your workspace successfully created.' }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
      end
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

  def workspaces
    workspaces = current_user.workspaces
  end

  def set_workspase
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:title)
  end
end
