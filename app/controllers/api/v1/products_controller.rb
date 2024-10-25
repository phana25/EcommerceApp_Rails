module Api
  module V1
    class ProductsController < AdminController
      skip_before_action :require_authentication
      skip_before_action :verify_authenticity_token
      def index
        @product = Product.all
        render json: @product
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      private
      def product_params
        params.require(:product).permit(:name, :description, :price, :stock, :category_id)
      end
    end
  end
end
