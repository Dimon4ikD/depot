class OrderMailer < ApplicationMailer
  layout false
  default from: "noreply@mail.msiu.ru"

  def info_email(order)
    @order=order
    mail(to: @order.user.email, subject: "Заказ №#{@order.id}")
  end
end
