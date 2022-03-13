# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :books
  validates :genre, :image_url, presence: true
  validates :genre, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: /\.(jpg|png)\z/i,
    message: 'must be a URL for JPG or PNG image.'
  }
end
