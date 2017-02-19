class ReviewsController < ApplicationController

  before_action :require_login

  def new
    @review = Review.new
  end

  def create
    product = Product.find(params[:product_id].to_i)
    rating = params[:review][:rating]
    description = params[:review][:description]
    if rating && description
      @review = Review.new(product_id: product.id, user_id: current_user.id, rating: rating.to_i, description: description)
      @review.save
    else
      redirect_to "/products/#{params[:product_id]}"
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Your review was deleted successfully."
      redirect_to @product
    else
      flash[:error] = "There was an error deleteing the purchase."
      render :show
    end
  end

  private
    def require_login
      redirect_to login_path unless current_user
    end

end


#
#   def create
#     @review = Review.new(review_params)
#     if @review.save
#
# redirect_to("/products/:id")
#       # respond_to do |format|
#       #   format.html { redirect_to @review } #, notice: 'Post was successfully created'
#       #   format.json {render :show, status: :created, location: @review }
#       #   format.js
#       # end
#     end
#   end
#
#   def update
#     @review.update(description: @review.description, rating: @review.rating)
#   end
#
#   def destroy
#     @review = Review.find params[:id]
#     @review.destroy
#   end
