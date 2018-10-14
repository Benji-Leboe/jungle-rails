class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @review = Review.create(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    if @review.save!
      redirect_to product_path(@product.id)
    else
      redirect_to product_path(@product.id)
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id
    )
  end
end
