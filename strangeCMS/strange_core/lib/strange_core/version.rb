module StrangeCore
  VERSION = File.read(File.expand_path("../../../../CMS_VERSION", __FILE__)).strip
  def self.version
    VERSION
  end
end
