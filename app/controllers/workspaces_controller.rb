class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = current_user.workspaces
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
