class User < ActiveRecord::Base
  belongs_to :department

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :grade, presence: true
  validates :department, presence: true

  has_secure_password
end
