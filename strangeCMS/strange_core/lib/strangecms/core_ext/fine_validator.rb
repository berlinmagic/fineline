# encoding: binary
# => require 'strangecms/core_ext/rfc822'
ActiveRecord::Base.class_eval do
  EmailAddress = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{2,63}\.[a-zA-Z]{2,6})$/i
  
  def self.validate_email_field(attr_name, value, options={})
    # .. add docu !
    unless value =~ EmailAddress
      self.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.email_error_message')) 
    end
  end
end