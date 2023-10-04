class TaskList < ApplicationRecord
  validates :title, presence: true, length: { maximum: 80 }

  belongs_to :workspace
end
