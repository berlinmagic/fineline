# encoding: utf-8
class KontaktMailer < ActionMailer::Base
  default :from => Strangecms::Kontakt::Config[:mail_von]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.kontakt_mail.subject
  #
  def kontakt_mail(data)
    @data = data

    mail  :to     =>  Strangecms::Kontakt::Config[:mail_an],
          :bcc    =>  Strangecms::Kontakt::Config[:mail_bcc],
          :from   =>  data.email
  end
  
  def antwort_mail(data)
    @data = data

    mail  :to     =>  data.email,
          :bcc    =>  Strangecms::Kontakt::Config[:mail_bcc]
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kontakt_mailer.thankyou_mail.subject
  #
  def thankyou_mail(data)
    @data = data

    mail  :to     =>  data.email
  end
end
