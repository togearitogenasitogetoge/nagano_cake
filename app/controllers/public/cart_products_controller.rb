class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_customer.cart_products.all
  end

  def update
    @cart_product = CartProduct.find(params[:product_id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_product = CartProduct.find(params[:product_id])
    CartProduct.product.destroy_all
    redirect_to cart_product_path
  end

  def destroy
    @cart_product = CartProduct.find(:product_id)
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def create
    @product = Product.find(cart_product_params[:product_id])
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
  # if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
		# 	current_customer.cart_product.find_by(product_id: params[:cart_product][:product_id]).cart_product.quantity += params[:cart_product][:quantity].to_i
      # @cart_product.save
		# 	redirect_to cart_products_path
		# elsif @cart_product.save
		# 	redirect_to cart_products_path
		# else
		  # render "public/products/show"
		# end
  end

  private

  def cart_product_params
      params.require(:cart_product).permit(:customer_id, :product_id, :quantity)
  end
end
