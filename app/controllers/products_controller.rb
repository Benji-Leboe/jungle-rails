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

  def self.average_rating(product_id)
    reviews = Review.where(product_id: product_id)
    count = 0
    total_rating = 0
    reviews.each do |review|
      count += 1
      total_rating += review.rating 
    end
    total_rating > 0 ? (total_rating/count).round : 0
  end

  def show_author(review)
    @user = User.find(review.user_id)
  end
  helper_method :show_author

end