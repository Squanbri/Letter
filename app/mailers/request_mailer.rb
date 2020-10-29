class RequestMailer < ApplicationMailer
  default from: "info@mystore.localhost",
          template_path: 'mailers/request'

  def send_request(message)
    @message = message
    mail to: 'Enya-ma@mail.ru',
            subject: "Message sent"
  end
end
