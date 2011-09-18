# encoding: utf-8
class StrangeSitesDashPass
    def initialize
        @dash = Strangecms::Config[:show_dashboard] ? true : false
    end

    def matches?(request)
        return true if @dash
        false
    end
end