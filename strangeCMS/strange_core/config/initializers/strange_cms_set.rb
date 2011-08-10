### =>  Code von Spree übernommen und angepasst  (https://github.com/spree/spree)  <= ###

ActiveRecord::Base.class_eval do
  include Strangecms::Preferences
  include Strangecms::Preferences::ModelHooks
end


# Initialize mail server settings
Strangecms::Preferences::MailSettings.init

# Initialize CMS-local-settings
Strangecms::Preferences::CmsSettings.init