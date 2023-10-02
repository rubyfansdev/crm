class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @task_list = TaskList.new
  end

  def show
    task_list
  end

  def create
    @task_list = workspace.task_lists.build(task_list_params)

    respond_to do |format|
      if @task_list.save
        format.turbo_stream do
          render turbo_stream: [turbo_stream.update('workspace_task_list', partial: '#', locals: { task_list: @task_list })]
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('alert', partial: 'shared/errors', locals: { resource: @task_list })
        end
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if task_list.update(task_list_params)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.update('workspace', partial: '#', locals: { task_list: @task_list })]
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('alert', partial: 'shared/errors', locals: { resource: task_list })
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      task_list.destroy
      format.turbo_stream do
        render turbo_stream: [turbo_stream.remove(task_list),
                              turbo_stream.update('workspace',
                                                  partial: '#')]
      end
      format.html { redirect_to worksapce, notice: 'Tasklist was deleted' }
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title)
  end

  def task_list
    TaskList.find(params[:id])
  end

  def workspace
    WorkSpace.find(params[:workspace_id])
  end
end
