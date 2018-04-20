class RequestsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.requests_mailer.confirmation.subject
  #
  def confirmation(request)
    @request = request

    mail to: @request.email,
    	subject: 'Заявка на оформление кредитной карты'
  end
end
