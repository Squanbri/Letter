class FeedbackMailer < ApplicationMailer
  def feedback_email
    @form = params[:form]
    mail(to: 'ayfaf.yfafya@yandex.ru', subject: 'Новый запрос')
  end
  # def feedback_email(fio, phone, company, skills, comment)
  #   @fio = fio
  #   @phone = phone
  #   @company = company
  #   @skills = skills
  #   @comment = comment
  #   mail(from: 'product-rails', to: 'addr@example.com', subject: 'Тема письмаы')
  # end
end
