class Workspace < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :members, dependent: :destroy
  has_many :users, through: :members, dependent: :destroy
end
