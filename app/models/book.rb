# frozen_string_literal: true

class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :images, presence: true
  validates :title, uniqueness: true
  validates :images, allow_blank: true, format: {
    with: /\.(jpg|png)\z/i,
    message: 'must be a URL for JPG or PNG image.'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
