# frozen_string_literal: true

class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    Cart.all.each do |cart|
      count = cart.line_items.group(:book_id).sum(:quantity)
      count.each do |book_id, quantity|
        next unless quantity > 1

        cart.line_items.where(book_id:).delete_all
        item = cart.line_items.build(book_id:)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    LineItem.where('quantity>1').each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          book_id: line_item.book_id,
          quantity: 1
        )
      end
      line_item.destroy
    end
  end
end
