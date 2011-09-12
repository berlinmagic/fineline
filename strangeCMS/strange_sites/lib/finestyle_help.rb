# encoding: utf-8
module FinestyleHelp
  module InstanceMethods
    
    require "yui/compressor"
    
    def fine_borderRadius(radius=nil)
        radius = radius.blank? ? 'none' : radius
        " -khtml-border-radius: 	#{ radius };
          -webkit-border-radius: 	#{ radius }; 
    		  -moz-border-radius: 	  #{ radius }; 
    		  -o-border-radius: 		  #{ radius }; 
    		  -ms-border-radius: 		  #{ radius };
    		  border-radius: 			    #{ radius };
    		  behavior: url(/stylesheets/border-radius.htc);  "
    end
    
    def fine3_borderRadius(radius=nil,spezialCorner=nil,spezialRadius=nil)
        r1 = radius.blank? ? 'none' : radius
        cc = !spezialCorner.blank? && %w(lt lb rt rb).include?(spezialCorner) ? spezialCorner : ''
        r2 = !cc.blank? ? (spezialRadius || 0) : r1
        "  -khtml-border-radius: 	#{cc == 'lt' ? r2 : r1} #{cc == 'rt' ? r2 : r1} #{cc == 'rb' ? r2 : r1} #{cc == 'lb' ? r2 : r1};
           -webkit-border-radius: 	#{cc == 'lt' ? r2 : r1} #{cc == 'rt' ? r2 : r1} #{cc == 'rb' ? r2 : r1} #{cc == 'lb' ? r2 : r1}; 
        	 -moz-border-radius: 	  #{cc == 'lt' ? r2 : r1} #{cc == 'rt' ? r2 : r1} #{cc == 'rb' ? r2 : r1} #{cc == 'lb' ? r2 : r1}; 
        	 -o-border-radius: 		  #{cc == 'lt' ? r2 : r1} #{cc == 'rt' ? r2 : r1} #{cc == 'rb' ? r2 : r1} #{cc == 'lb' ? r2 : r1}; 
        	 -ms-border-radius: 		  #{cc == 'lt' ? r2 : r1} #{cc == 'rt' ? r2 : r1} #{cc == 'rb' ? r2 : r1} #{cc == 'lb' ? r2 : r1};
        	 border-radius: 			    #{cc == 'lt' ? r2 : r1} #{cc == 'rt' ? r2 : r1} #{cc == 'rb' ? r2 : r1} #{cc == 'lb' ? r2 : r1};  "
    end
    
    def fineBorderRadius(lt=nil,rt=nil,rb=nil,lb=nil)
        lt = lt.blank? || lt == 'none' ? 0 : lt
        rt = rt.blank? || rt == 'none' ? 0 : rt
        rb = rb.blank? || rb == 'none' ? 0 : rb
        lb = lb.blank? || lb == 'none' ? 0 : lb
        "  -khtml-border-radius: 	  #{ lt } #{ rt } #{ rb } #{ lb };
           -webkit-border-radius: 	#{ lt } #{ rt } #{ rb } #{ lb }; 
        	 -moz-border-radius: 	    #{ lt } #{ rt } #{ rb } #{ lb }; 
        	 -o-border-radius: 		    #{ lt } #{ rt } #{ rb } #{ lb }; 
        	 -ms-border-radius: 		  #{ lt } #{ rt } #{ rb } #{ lb };
        	 border-radius: 			    #{ lt } #{ rt } #{ rb } #{ lb };  "
    end

    def fine_backgroundGradient(top,bottom=nil)
        bottom = bottom.blank? ? top : bottom
        " background: #{ top };
          background: -khtml-gradient(linear, left top, left bottom, from(#{ top }), to(#{ bottom }));
      	  background: -moz-linear-gradient(top, #{ top } 0%,  #{ bottom } 100%);
      	  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#{ top }), color-stop(100%,#{ bottom }));
      	  background: -webkit-linear-gradient(top, #{ top } 0%,#{ bottom } 100%);
      	  background: -o-linear-gradient(top, #{ top } 0%,#{ bottom } 100%);
      	  background: -ms-linear-gradient(top, #{ top } 0%,#{ bottom } 100%);
      	  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#{ top }', endColorstr='#{ bottom }',GradientType=0 );
      	  background: linear-gradient(top, #{ top } 0%,#{ bottom } 100%);    "
    end
    
    def fine_Gradient(orientation=nil, pts={})
        orientationz = %w(horizontal vertikal radial diagonal1 diagonal2)
        way = !orientation.blank? && orientationz.include?(orientation) ? orientation : 'vertikal'  
        werte = []
        pts.each { |key, value| [ werte[key] = value ] }
        top = werte.first
        bottom = werte.last
        ms_gradient = false
        ms_way = 0
        t = 'linear'
        if way == 'horizontal'
          x = 'left 50%'
          y = 'right 50%'
          z = 'left'
          ms_gradient = true
          ms_way = 1
        elsif way == 'diagonal1'
          x = 'left top'
          y = 'right bottom'
          z = 'left top'
        elsif way == 'diagonal2'
          x = 'left bottom'
          y = 'right top'
          z = 'left bottom'
        elsif way == 'radial'
          t = 'radial'
          x = '50% 50%, 1'
          y = '50% 50%, 100'
          z = '50% 50%, circle cover'
        else
          x = '50% top'
          y = '50% bottom'
          z = 'top'
          ms_gradient = true
        end
        wk_werte = ""
        std_werte = ""
        werte.each_with_index do |w,i|
          unless w.blank?
            std_werte = std_werte + ", #{w} #{i}%"
            unless (i == 0) || (i == 100)
              wk_werte = wk_werte + ", color-stop(#{i}%, #{w})"
            end
          end
        end
        std_bg = "background: #{top};"
        webkit = "background-image: -webkit-gradient(#{t}, #{x}, #{y}, from(#{top}), to(#{bottom})" + wk_werte + ");"
        khtml = "background-image: -khtml-gradient(#{t}, #{x}, #{y}, from(#{top}), to(#{bottom})" + wk_werte + ");"
        wkit = "background-image: -webkit-#{t}-gradient(#{z}" + std_werte + ");"
        moz = "background-image: -moz-#{t}-gradient(#{z}" + std_werte + ");"
        o = "background-image: -o-#{t}-gradient(#{z}" + std_werte + ");"
        ms = "background-image: -ms-#{t}-gradient(#{z}" + std_werte + ");"
        all = "background-image: #{t}-gradient(#{z}" + std_werte + ");"
        ms_std = "filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#{ top }', endColorstr='#{ bottom }',GradientType=#{ms_way} );"
        
        " #{std_bg} 
          #{webkit}
          #{khtml}
          #{wkit}
          #{moz}
          #{o}
          #{ms}
          #{ms_std if ms_gradient}
          #{all} "
    end
    
    def fine_boxShadow(shadow=nil)
        shadow = shadow.blank? ? 'none' : shadow
        "-o-box-shadow:       #{ shadow };
         -webkit-box-shadow:  #{ shadow };
         -moz-box-shadow:     #{ shadow };
         -ms-box-shadow:      #{ shadow };
         -khtml-box-shadow:   #{ shadow };
         box-shadow:          #{ shadow };"
    end
    
    def fine_textShadow(shadow=nil)
        shadow = shadow.blank? ? 'none' : shadow
        # => -o-text-shadow:       #{ shadow };
        # => -webkit-text-shadow:  #{ shadow };
        # => -moz-text-shadow:     #{ shadow };
        # => -ms-text-shadow:      #{ shadow };
        # => -khtml-text-shadow:   #{ shadow };
        "text-shadow:          #{ shadow };"
    end
    
    def fine_opacity( opacity )
      opac = 1.0
      if opacity
        if opacity > 1
          opac = opac * "0.#{ opacity }".to_f
        else
          opac = opac * "#{ opacity }".to_f
        end
      end
      opaz = (100 * opac).to_i if opac < 1
      " opacity: #{opac};
        -moz-opacity: #{opac};
        -webkit-opacity: #{opac};
        -ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=#{ opaz })';
        filter: alpha(opacity=#{ opaz }); "
    end
    
    def my_fine_minify(css)
      ocss = css
      one_line = Regexp.new(/\/\*.*?\*\//)              # Only match one-line comments
      multi_line = Regexp.new(/\/\*.*?\*\//m)           # Match single and multi-line comments   alt:  /\/\*[\\s\\S]*?\\*/
      css = css.to_s.gsub(/\s+/, " ")
      css = css.gsub(multi_line, '')
      css = css.gsub('; ', ';')
      css = css.gsub(': ', ':')
      css = css.gsub(' {', '{')
      css = css.gsub('{ ', '{')
      css = css.gsub(' }', '}')
      css = css.gsub('} ', '}')
      css = css.gsub(';}', '}')
      css = css.gsub(', ', ',')
      css = css.to_s.gsub(/\s+/, " ")
      return css
    end
    
    def fine_css_minify(css)
      compressor = YUI::CssCompressor.new
      if Strangecms::Config[:compress_stylez]
        this_css = compressor.compress(css)
      else
        this_css = css
      end
      this_css
    end
    
    def fine_js_minify(js)
      compressor = YUI::JavaScriptCompressor.new(:optimize => true, :preserve_semicolons => false, :munge => true)
      #compressor = YUI::JavaScriptCompressor.new
      if Strangecms::Config[:compress_scriptz]
        this_js = compressor.compress(js)
      else
        this_js = js
      end
      this_js
    end
    
  end ### =>  End of InstanceMethods

  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :helper, 'fine_form'
    receiver.send :helper, 'fine_styler'
    receiver.send :helper_method, 'fine_borderRadius'
    receiver.send :helper_method, 'fine3_borderRadius'
    receiver.send :helper_method, 'fineBorderRadius'
    receiver.send :helper_method, 'fine_backgroundGradient'
    receiver.send :helper_method, 'fine_Gradient'
    receiver.send :helper_method, 'fine_boxShadow'
    receiver.send :helper_method, 'fine_textShadow'
    receiver.send :helper_method, 'fine_css_minify'
    receiver.send :helper_method, 'fine_js_minify'
  end
  
end