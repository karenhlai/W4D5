class User < ApplicationRecord
  validates :username, presence: true
  # validates :password, length: { minimum: 6 }
end
