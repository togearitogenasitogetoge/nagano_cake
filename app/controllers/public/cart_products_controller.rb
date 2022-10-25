class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!


  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_products = current_customer.cart_products.all
      @cart_products.each do |cart_product|
        if cart_product.product_id == @cart_product.product_id
          new_quantity = cart_product.quantity + @cart_product.quantity
          cart_product.update_attribute(:quantity, new_quantity)
          @cart_product.delete
        end
      end
      @cart_product.save
		  redirect_to cart_products_path
  end


  def index
    @cart_products = current_customer.cart_products
    @total = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_products = current_customer.cart_products
    CartProduct.destroy_all
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end


  private

  def cart_product_params
      params.require(:cart_product).permit(:customer_id, :product_id, :quantity)
  end
end
