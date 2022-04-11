# frozen_string_literal: true

class Category < ApplicationRecord
  has_one_attached :image
  has_many :books
  # has_many :image_elements
  # validates :genre, :image_url, presence: true
  validates :genre, uniqueness: true
  # validates :image_url, allow_blank: true, format: {
  #   with: /\.(jpg|png)\z/i,
  #   message: 'must be a URL for JPG or PNG image.'
  # }
  # validate :main_picture_format
  #
  # private
  #
  # def main_picture_format
  #   return unless image.attached?
  #   return if image.blob.content_type.start_with? 'image/'
  #   image.purge_later
  #   errors.add(:image, 'needs to be an image')
  # end
end
