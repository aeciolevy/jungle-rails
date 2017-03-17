class OrderReceipt < ApplicationMailer
  default from: "no-reply@jungle.com"

  def send_order_receipt(user)
    @user = user
    mail(to: @user.email, subject: "Thanks for buys these products")
  end
end
