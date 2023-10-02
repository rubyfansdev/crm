class TaskList < ApplicationRecord
  validates :title, presence: true, length: { minimum: 80 }

  belongs_to :workspace
end
