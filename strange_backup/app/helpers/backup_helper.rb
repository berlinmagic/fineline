# encoding: utf-8
module BackupHelper
  
  
  
  def strange_yaml_site_builder(objekt)
    data = YAML::load(objekt)
    attrs = data.ivars
    model = data.class.new
    attrs.each do |k, v|
      if k == 'attributes'
        v.each do |k, v|
          unless (k == "created_at") || (k == "updated_at")
            model.send :write_attribute, k.to_sym , v 
          end
        end
      end
      if k == 'abschnitte'
        v.map do |k|
          xx = k.ivars
          xx.each do |k, v|
            if k == 'attributes'
              abschnitt = Abschnitt.new
              v.each do |k, v|
                unless k == "created_at" || k == "updated_at"
                  abschnitt.send :write_attribute, k.to_sym , v
                end
              end
              model.abschnitte << abschnitt
            end
          end
        end
      end
    end
    return model
  end
  
  
  # => def strange_yaml_site_builder(objekt)
  # =>   data = YAML::load(objekt)
  # =>   attrs = data.ivars
  # =>   model = data.class.new
  # =>   attrs.each do |k, v|
  # =>     if k == 'attributes'
  # =>       v.each do |k, v|
  # =>         unless (k == "created_at") || (k == "updated_at")
  # =>           model.send :write_attribute, k.to_sym , v 
  # =>         end
  # =>       end
  # =>     end
  # =>     if k == 'abschnitte'
  # =>       v.map do |k|
  # =>         xx = k.ivars
  # =>         xx.each do |k, v|
  # =>           if k == 'attributes'
  # =>             abschnitt = Abschnitt.new
  # =>             v.each do |k, v|
  # =>               unless k == "created_at" || k == "updated_at"
  # =>                 abschnitt.send :write_attribute, k.to_sym , v
  # =>               end
  # =>             end
  # =>             model.abschnitte << abschnitt
  # =>           end
  # =>         end
  # =>       end
  # =>     end
  # =>   end
  # =>   return model
  # => end
  # 
end
