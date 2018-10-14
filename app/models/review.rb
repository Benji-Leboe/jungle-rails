class Review < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :product

  validates :description, presence: true
  validates :rating, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}

  validate do |review|
    review.logged_in
    review.for_product
  end

  def logged_in
    errors.add(:base, 'You must be logged in to leave a review') unless user_id != nil
  end

  def for_product
    errors.add(:base, 'You cannot leave a review on a non-existent product') unless product_id != nil
  end

end
