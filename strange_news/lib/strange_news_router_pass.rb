# encoding: utf-8
class StrangeNewsRouterPass
    def initialize
        @news_link = 'fineline_CMS_News_Modul'
        if Seite.table_exists?
          
          if Seite.where("system_name = ? AND deleted = ?", 'news_site', false).count > 0
            @news_link = Seite.where("system_name = ? AND deleted = ?", 'news_site', false).first.link
          end
          
        end
        @passthru = []
        if News.table_exists?
          News.all.each do |newz|
            @passthru << "#{ @news_link }#{ newz.slug }"
          end
        end
    end

    def matches?(request)
        
        return false if request.fullpath.start_with?('/admin/')
        return false if request.fullpath.start_with?('/system/')
        return false if request.fullpath.start_with?('/backups/')
        
        # => return true if request.fullpath.start_with?("#{@passthru}")
        
        return true if @passthru.include?(request.fullpath)
        
        # => return true if request.fullpath.start_with?("/aktuelles/")
        # => !request.fullpath.start_with?('/auth/')
        false
    end
end