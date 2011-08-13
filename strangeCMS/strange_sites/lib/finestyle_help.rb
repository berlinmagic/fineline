# encoding: utf-8
module FinestyleHelp
  module InstanceMethods
    
    def fine_borderRadius(radius=nil)
        radius = radius.blank? ? 'none' : radius
        " -khtml-border-radius: 	#{ radius };
          -webkit-border-radius: 	#{ radius }; 
    		  -moz-border-radius: 	  #{ radius }; 
    		  -o-border-radius: 		  #{ radius }; 
    		  -ms-border-radius: 		  #{ radius };
    		  border-radius: 			    #{ radius };  "
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
    
    def fine_boxShadow(shadow=nil)
        shadow = shadow.blank? ? 'none' : shadow
        "-o-box-shadow:       #{ shadow };
         -webkit-box-shadow:  #{ shadow };
         -moz-box-shadow:     #{ shadow };
         -ms-box-shadow:      #{ shadow };
         -khtml-box-shadow:   #{ shadow };
         box-shadow:         #{ shadow };   "
    end
    
    def fine_textShadow(shadow=nil)
        shadow = shadow.blank? ? 'none' : shadow
        " -o-text-shadow:       #{ shadow };
          -webkit-text-shadow:  #{ shadow };
          -moz-text-shadow:     #{ shadow };
          -ms-text-shadow:      #{ shadow };
          -khtml-text-shadow:   #{ shadow };
          text-shadow:          #{ shadow };   "
    end
    
    def fine_minify(css)
      old_css = css
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
      return old_css
    end
    
    
  end

  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :helper_method, 'fine_borderRadius'
    receiver.send :helper_method, 'fine3_borderRadius'
    receiver.send :helper_method, 'fine_backgroundGradient'
    receiver.send :helper_method, 'fine_boxShadow'
    receiver.send :helper_method, 'fine_textShadow'
    receiver.send :helper_method, 'fine_minify'
  end
  
end