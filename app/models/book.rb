# frozen_string_literal: true

class Book < ApplicationRecord
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
