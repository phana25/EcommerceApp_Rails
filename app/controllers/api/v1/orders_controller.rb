module Api
  module V1
    class OrdersController < AdminController
      skip_before_action :require_authentication
      skip_before_action :verify_authenticity_token
      def index
        @orders = Order.all
        render json: @orders
      end

      def create
        @order = Order.new(order_params)
        if @order.save
          render json: @order, status: :created
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      private
      def order_params
        params.require(:order).permit(:user_id, :product_id, :amount, :status, :payment, :phone_number)
      end
    end
  end
end
