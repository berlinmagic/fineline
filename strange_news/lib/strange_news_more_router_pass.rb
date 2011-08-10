# encoding: utf-8
class StrangeNewsMoreRouterPass
    def initialize
        @passthru = 'fineline_CMS_News_Modul'
        if Seite.table_exists?
          
          if Seite.where("system_name = ? AND deleted = ?", 'news_site', false).count > 0
            @passthru = Seite.where("system_name = ? AND deleted = ?", 'news_site', false).first.link
          end
          
        end
    end

    def matches?(request)
        
        return false if request.fullpath.start_with?('/admin/')
        return false if request.fullpath.start_with?('/system/')
        return false if request.fullpath.start_with?('/backups/')

        return true if request.fullpath.start_with?("#{@passthru}/by_date")
        return true if request.fullpath.start_with?("#{@passthru}/by_tag")
        return true if request.fullpath.start_with?("#{@passthru}/page")

        false
    end
end