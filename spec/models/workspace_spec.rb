require 'rails_helper'

RSpec.describe Workspace, type: :model do
  it { is_expected.to belong_to :author }
  it { is_expected.to have_many(:members).dependent(:destroy)}
  it { is_expected.to have_many(:users).dependent(:destroy)}
  it { is_expected.to have_many(:task_lists).dependent(:destroy)}
  it { should validate_presence_of :title }
end
