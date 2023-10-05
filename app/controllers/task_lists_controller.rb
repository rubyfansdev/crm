class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def new
    workspace
    @task_list = workspace.task_lists.new
  end

  def show
   task_list
  end

  def create
    @task_list = workspace.task_lists.build(task_list_params)
    respond_to do |format|
      if @task_list.save
        format.turbo_stream do
          render turbo_stream: [turbo_stream.update('workspace_task_list', partial: 'task_lists/task_lists',
                                                                           locals: { task_list: @task_list,
                                                                                     workspace: })]
        end
        format.html { redirect_to workspace, notice: 'Your task_list successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('alert', partial: 'shared/errors', locals: { resource: @task_list })
        end
      end
    end
  end

  def edit
    workspace
    task_list
  end

  def update
    respond_to do |format|
      if task_list.update(task_list_params)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('workspace_task_list', partial: 'task_lists/task_lists',
                                                                            locals: { task_list:,
                                                                                      workspace: })]
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('alert', partial: 'shared/errors', locals: { resource: task_list })
        end
      end
    end
  end

  def destroy
    # debugger
    respond_to do |format|
      task_list.destroy
      format.turbo_stream do
        render turbo_stream: [turbo_stream.remove(task_list),
                              turbo_stream.update('workspace_task_list', partial: 'task_lists/task_lists',
                                                                         locals: { workspace: })]
      end
      format.html { redirect_to workspace, notice: 'Tasklist was deleted' }
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end

  def task_list
    @task_list ||= workspace.task_lists.find(params[:id])
  end

  def workspace
    @workspace ||= Workspace.find(params[:workspace_id])
  end
end
