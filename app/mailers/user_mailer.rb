class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
 
    def email_receipt(params)
      @email = params[:email]
      @order = params[:order]
      mail(to: @email, subject: "Order Number #{@order.id}")
    end

end
