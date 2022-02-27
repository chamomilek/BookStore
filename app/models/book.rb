class Book < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
end
