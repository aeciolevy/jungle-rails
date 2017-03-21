class OrderReceipt < ApplicationMailer
  default from: "no-reply@jungle.com"

  def send_order_receipt(user, order)
    @user = user
    @order = order
    mail(to: @user.email , subject: "Order #{@order.id} jungle store")
  end
end
