class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  belongs_to :house
end
