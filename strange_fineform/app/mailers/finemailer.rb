# encoding: utf-8
class Finemailer < ActionMailer::Base
  default :from => Strangecms::Fineform::Config[:mail_von]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.kontakt_mail.subject
  #
  def fine_mail(data)
    @data = data

    mail  :to     =>  Strangecms::Fineform::Config[:mail_an],
          :bcc    =>  Strangecms::Fineform::Config[:mail_bcc],
          :from   =>  data.absender
  end
  
  def fine_antwort(data)
    @data = data

    mail  :to     =>  data.absender,
          :bcc    =>  Strangecms::Fineform::Config[:mail_bcc]
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.thankyou_mail.subject
  #
  def fine_thankyou(data)
    @data = data

    mail  :to     =>  data.absender
  end
end
