class Book < ApplicationRecord
  belongs_to :category

  # validates :title, presence: true, length: {minimum: 2}
  # validates :description, presence: true, length: {minimum: 2}
  # validates :images, presence: true, length: {minimum: 2}
  # validates :price, presence: true, length: {minimum: 2}
  # validates :pages, presence: true, length: {minimum: 2}
  # validates :language, presence: true, length: {minimum: 2}
  # validates :dimensions, presence: true
  # validates :publication_date, presence: true
  # validates :weight, presence: true
  # validates :category_id, presence: true

end
