# encoding: binary
# require 'strangecms/core_ext/rfc822'
class EmailValidator < ActiveModel::EachValidator
  
  EmailAddress = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{2,63}\.[a-zA-Z]{2,6})$/i


  def validate_each(record, attribute, value)
    unless value =~ EmailAddress
      record.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.email_error_message')) 
    end
  end
  
end