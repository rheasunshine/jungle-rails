class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id]).order(created_at: :desc)
    # byebug
    @average_rating = Review.average(:rating).round(2)
    # byebug
  end

end
