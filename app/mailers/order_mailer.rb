class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(user, order_id)
    @user = user
    @order_id = order_id
    @url = 'http://localhost:3000'
    puts mail(to: @user, subject: "Your Order Confirmation") do |format|
      puts format.text
      puts format.html
    end
  end
end
