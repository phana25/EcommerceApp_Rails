class AdminController < ApplicationController
  layout "admin"
  def index
    @total_orders = Order.count
    @total_users = User.count
    @total_revenues= Order.joins(:product).where(payment: true).sum("products.price * orders.amount")
  end
end
