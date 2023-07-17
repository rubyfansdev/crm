class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :members, dependent: :destroy
  has_many :workspaces, through: :members, dependent: :destroy
  has_many :author_workspaces, foreign_key: :author_id, class_name: 'Workspace', dependent: :destroy
end
