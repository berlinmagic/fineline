class HeaderCell < Cell::Rails
  include StrangeSitesHelp
  include FinestyleHelp
  
  cache :fader do |cell, options|
      "#{ options[:header].id.to_s }"
  end
  cache :fader_js do |cell, options|
      "#{ options[:header].id.to_s }"
  end
  
  #cache :fader
  #cache :fader_js

  def display(args)
    @seite = args[:seite]
    if @seite
      if @seite.header
        @header = @seite.header
      else
        @header = Header.first if Strangecms::Header::Config[:generell_show_header]
      end
    else
      @header = Header.first if Strangecms::Header::Config[:generell_show_header]
    end
   render
  end
  
  def script(args)
    @seite = args[:seite]
    if @seite
      if @seite.header
        @header = @seite.header
      else
        @header = Header.first if Strangecms::Header::Config[:generell_show_header]
      end
    else
      @header = Header.first if Strangecms::Header::Config[:generell_show_header]
    end
    render
  end
  
  def fader(args)
    @seite = args[:seite]
    @header = args[:header]
    render
  end
  
  def fader_js(args)
    @seite = args[:seite]
    @header = args[:header]
    render
  end
  
  def accordion(args)
    @seite = args[:seite]
    @header = args[:header]
    render
  end
  
  def accordion_js(args)
    @seite = args[:seite]
    @header = args[:header]
    render
  end

end
