module Api
  module V1
    class OrderItemsController < AdminController
      skip_before_action :require_authentication
      skip_before_action :verify_authenticity_token
      def index
        @order_items = OrderItem.all
        render json: @order_items
      end

      def create
        @order_item = OrderItem.new(order_item_params)
        if @order_item.save
          render json: @order_item, status: :created
        else
          render json: @order_item.errors, status: :unprocessable_entity
        end
      end

      private
      def order_item_params
        params.require(:order_item).permit(:order_id, :stock_id)
      end
    end
  end
end
