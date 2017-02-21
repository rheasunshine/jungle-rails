class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id]).order(created_at: :desc)
    if @reviews.length > 1
      @average_rating = Review.where(product_id: params[:id]).average(:rating).round(2)
    end
  end

end
