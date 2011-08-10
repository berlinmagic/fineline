module StrangeThemes
  module ControllerMethods
    extend ActiveSupport::Concern
    included do
      include StrangeThemes::CommonMethods
      include StrangeThemes::UrlHelpers
    end
    module ClassMethods
      def theme(name, options = {})
        before_filter(options) do |controller|
          controller.set_theme(name)
        end
      end
    end
    module InstanceMethods
      def theme(name)
        set_theme(name)
      end
    end
  end
end

ActiveSupport.on_load(:action_controller) { include StrangeThemes::ControllerMethods }

ActiveSupport.on_load(:action_mailer) { include StrangeThemes::ControllerMethods }

