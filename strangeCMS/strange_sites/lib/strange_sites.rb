  require "rails/all"
  
  require 'strange_core'
  require 'strange_user'
  
  
  require "acts_as_list"
  require "el_finder"
  # => require 'paperclip'
  # => require 'will_paginate'
  require 'kaminari'


  require 'strange_sites/fckeditor'
  require 'strange_sites/fckeditor_version'
  require 'strange_sites/fckeditor_file_utils'
  
  require 'strange_sites_help'
  require 'strange_sites_modul'

module StrangeSites
    class Engine < Rails::Engine


      config.autoload_paths += %W(#{config.root}/lib)

      #config.time_zone = 'Berlin'

      #config.i18n.default_locale = :de

      #config.action_view.javascript_expansions[:defaults] = %w(jquery.min jquery-ui.min rails jquery.easing jquery.slider jquery.alerts strange)


      def self.activate

        Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
          Rails.env == "production" ? require(c) : load(c)
        end

      end

      config.to_prepare &method(:activate).to_proc

    end
end