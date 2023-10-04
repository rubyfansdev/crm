require 'rails_helper'

RSpec.describe 'Workspaces', type: :request do
  let(:user) { create(:user) }
  let(:workspace) { create(:workspace, author: user) }

  before do
    sign_in(user)
  end

  describe 'GET /index' do
    it 'index http status success' do
      get workspaces_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'new http status success' do
      get new_workspace_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'show http status success' do
      get workspace_path(workspace)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'create http status success' do
      expect do
        post workspaces_path, params: {
          workspace: {
            title: 'My workspace',
            author: user
          }
        }
      end.to change(Workspace, :count).by(1)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /update' do
    it 'edit http status success' do
      get edit_workspace_path(workspace)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      delete workspace_path(workspace)
      expect(response).to redirect_to(root_path)
    end
  end
end
