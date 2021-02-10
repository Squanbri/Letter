class FormMailer < ApplicationMailer
  default from: 'info@mystore.localhost',
          template_path: 'mailers/form'
  def form_send(form)
    @form = form
    mail to: 'ayfaf.yfafya@yandex.ru',
         subject: "Form send"
  end
end
