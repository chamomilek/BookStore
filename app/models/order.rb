class Order < ApplicationRecord
  enum pay_type: {
    "Credit Card" => 1,
    "CiWi Account" => 2
  }
end
