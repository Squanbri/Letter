class ApplicationMailer < ActionMailer::Base
  default from: 'rails-product@mail.ru'
  #default from: 'product-rails@yandex.ru'
  layout 'mailer'
end
