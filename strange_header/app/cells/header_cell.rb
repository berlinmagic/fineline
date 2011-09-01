class HeaderCell < Cell::Rails
  include StrangeSitesHelp
  include FinestyleHelp
  
  cache :fader do |cell, options|
      options[:header]
  end
  
  cache :fader_js do |cell, options|
      options[:header]
  end

  def display(args)
    @seite = args[:seite]
    if @seite
      @header = @seite.header || Header.first
    else
      @header = Header.first
    end
   render
  end
  
  def fader(args)
    @seite = args[:seite]
    @header = args[:header]
    render
  end
  
  def script(args)
    @seite = args[:seite]
    if @seite
      @header = @seite.header || Header.first
    else
      @header = Header.first
    end
    render
  end
  
  def fader_js(args)
    @seite = args[:seite]
    @header = args[:header]
    render
  end
  

end
