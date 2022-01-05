class Template < ApplicationRecord
  validates :title, :description, :document, presence: true
end
