# frozen_string_literal: true

class Order < ApplicationRecord
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  enum pay_type: {
    'Credit Card' => 1,
    'CiWi Account' => 2
  }
end
