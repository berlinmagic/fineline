require 'rack/cache'
require 'dragonfly/rails/images'
# => require 'dragonfly-rmagick'
# => require 'strangecms/image_ext/watermark_processor'
# => require 'strangecms/image_ext/vignette_processor' 
# => require 'strangecms/image_ext/fade_processor' 

app = Dragonfly[:images]
app.configure_with(:imagemagick)
# => app.configure_with(:rmagick) 
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :image_accessor)

#app.processor.register(Dragonfly::Processing::WatermarkProcessor) 
#app.processor.register(Dragonfly::Processing::VignetteProcessor) 
#app.processor.register(Dragonfly::Processing::FadeProcessor) 