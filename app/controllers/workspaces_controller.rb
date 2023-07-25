class WorkspacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workspace, only: %i[show edit update destroy]

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
        # debugger
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('alert', "#{@workspace.errors.full_messages.join(' ')}")
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.update('workspaces',
                                                    partial: 'workspaces/workspaces',
                                                    locals: { :workspaces => workspaces }),
                                turbo_stream.update('notice',
                                                    'Your workspace successfully updated.')]
        end
        format.html { redirect_to root_path, notice: 'Your workspace successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('alert', "#{@workspace.errors.full_messages.join(' ')}")
        end
        format.html { render :edit,  status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      @workspace.destroy if current_user == @workspace.author
      format.turbo_stream do
        render turbo_stream: [turbo_stream.remove(@question),
                              turbo_stream.update('workspaces',
                                                   partial: 'workspaces/workspaces',
                                                   locals: { :workspaces => workspaces })]
      end
      format.html { redirect_to root_path, notice: 'Workspace was deleted' }
    end
  end

  private

  def workspaces
    workspaces = current_user.workspaces
  end

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:title)
  end
end
