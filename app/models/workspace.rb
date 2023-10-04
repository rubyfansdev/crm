class Workspace < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :members, dependent: :destroy
  has_many :users, through: :members, dependent: :destroy
  has_many :task_lists, dependent: :destroy

  validates :title, presence: true

  after_create :add_author_to_members

  private

  def add_author_to_members
    members.create(user: author)
  end
end
