class User < ApplicationRecord
pay_customer

has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many(
  :templates,
  class_name: 'Template',
  foreign_key: 'user_id',
  inverse_of: :creator
)
end
