require 'rails_helper'

RSpec.describe 'TaskLists', type: :request do
  let(:user) { create(:user) }
  let(:workspace) { create(:workspace, author: user) }

  before do
    sign_in(user)
  end

  describe 'GET /new' do
    it 'new http status success' do
      get new_workspace_task_list_path(workspace)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'create http status success' do
      expect do
        post workspace_task_lists_path(workspace), params: {
          task_list: {
            title: 'My task list',
            description: 'Task description',
            workspace:
          }
        }
      end.to change(TaskList, :count).by(1)
      expect(response).to have_http_status(:redirect)
    end
  end
end
