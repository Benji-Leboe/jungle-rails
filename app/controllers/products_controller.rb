class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def show_reviews
    @reviews = Review.where(product_id: @product.id).order(created_at: :desc)
  end
  helper_method :show_reviews

  def show_author(review)
    @user = User.find(review.user_id)
    "#{@user.first_name} #{@user.last_name}"
  end
  helper_method :show_author

end