# encoding: utf-8
class StrangeSitesNodashPass
    def initialize
        @dash = Strangecms::Config[:show_dashboard] ? false : true
    end

    def matches?(request)
        return true if @dash
        false
    end
end