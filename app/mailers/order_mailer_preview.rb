class OrderMailerPreview < ApplicationMailer::Preview
  def order_confirmation
    OrderMailer.with(user: User.first, order_id: '12').order_confirmation
  end
end
