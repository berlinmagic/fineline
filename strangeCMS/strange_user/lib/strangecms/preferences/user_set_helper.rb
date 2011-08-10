module UserSetHelper
  def perform_my_time_string(time, period)
        if period == 'minutes'
          render :inline => time.minutes
        elsif period == 'hours'
    	    time.hours
    	  elsif period == 'days'
    	    time.days
    	  elsif period == 'weeks'
    	    time.weeks
    	  else
    	    time
    	  end
      end
end