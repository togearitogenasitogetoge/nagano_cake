class Public::CartProductsController < ApplicationController

  def index
    @cart_product = CartProduct.where(current_customer)
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_product = CartProduct.find(params[:id])
    CartProduct.product.destroy_all
    redirect_to cart_product_path
  end

  def destroy
    @cart_product = CartProduct.find(:product_id)
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  private

  def cart_product_params
      params.require(:cart_product).permit(:customer_id, :product_id, :amount)
      # amountはproduct作成者に合わせる
  end
end
