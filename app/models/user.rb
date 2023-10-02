class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :members, dependent: :destroy
  has_many :workspaces, through: :members, dependent: :destroy
  has_many :author_workspaces, foreign_key: :author_id, class_name: 'Workspace', dependent: :destroy
end
