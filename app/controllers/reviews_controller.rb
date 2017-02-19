class ReviewsController < ProductsController

  # @reviews = Review.where(product_id: params[:id])
  before_action :require_login

  def new
    @review = Review.new
  end

  def create
    byebug
    product = Product.find(params[:product_id].to_i)
    rating = params[:review][:rating]
    description = params[:review][:description]
    if rating && description
    product.reviews.create!(user_id: current_user.id, rating: rating.to_i, description: description)
    @review = product.reviews.create!(user_id: current_user.id, rating: rating.to_i, description: description)

    end
  else
    redirect_to "/products/#{params[:product_id]}"
  end


  def destroy
 Review.find(@review.id).destroy

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
