# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :book, null: false, foreign_key: true
      t.string :cart
      t.string :belongs_to

      t.timestamps
    end
  end
end
