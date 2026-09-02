class Guest < ApplicationRecord
  has_many :lists, dependent: :destroy
end
