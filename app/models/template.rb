class Template < ApplicationRecord
  has_one_attached :template_file
  belongs_to(
    :creator,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :templates
  )
  validates :title, :description, :template_file, presence: true
end
