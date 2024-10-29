class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :stock
  # belongs_to :product
end
