module ApplicationHelper
  
  def us_states
      [
        ["Select State", nil],
        ['Alabama', 'AL'],
        ['Alaska', 'AK'],
        ['Arizona', 'AZ'],
        ['Arkansas', 'AR'],
        ['California', 'CA'],
        ['Colorado', 'CO'],
        ['Connecticut', 'CT'],
        ['Delaware', 'DE'],
        ['District of Columbia', 'DC'],
        ['Florida', 'FL'],
        ['Georgia', 'GA'],
        ['Hawaii', 'HI'],
        ['Idaho', 'ID'],
        ['Illinois', 'IL'],
        ['Indiana', 'IN'],
        ['Iowa', 'IA'],
        ['Kansas', 'KS'],
        ['Kentucky', 'KY'],
        ['Louisiana', 'LA'],
        ['Maine', 'ME'],
        ['Maryland', 'MD'],
        ['Massachusetts', 'MA'],
        ['Michigan', 'MI'],
        ['Minnesota', 'MN'],
        ['Mississippi', 'MS'],
        ['Missouri', 'MO'],
        ['Montana', 'MT'],
        ['Nebraska', 'NE'],
        ['Nevada', 'NV'],
        ['New Hampshire', 'NH'],
        ['New Jersey', 'NJ'],
        ['New Mexico', 'NM'],
        ['New York', 'NY'],
        ['North Carolina', 'NC'],
        ['North Dakota', 'ND'],
        ['Ohio', 'OH'],
        ['Oklahoma', 'OK'],
        ['Oregon', 'OR'],
        ['Pennsylvania', 'PA'],
        ['Puerto Rico', 'PR'],
        ['Rhode Island', 'RI'],
        ['South Carolina', 'SC'],
        ['South Dakota', 'SD'],
        ['Tennessee', 'TN'],
        ['Texas', 'TX'],
        ['Utah', 'UT'],
        ['Vermont', 'VT'],
        ['Virginia', 'VA'],
        ['Washington', 'WA'],
        ['West Virginia', 'WV'],
        ['Wisconsin', 'WI'],
        ['Wyoming', 'WY']
      ]
  end
  
  def errors(object)
    render "layouts/errors", :object => object
  end
  
  def flash_notifier
    if flash[:error]
      notice = content_tag(:p, flash[:error], :class => "error-message")
    end
    if flash[:notice]
      notice = content_tag(:p, flash[:notice], :class => "notice-message")
  	end
  	if flash[:success]
  	  notice = content_tag(:p, flash[:success], :class => "success-message")
	  end
  	return notice
  end
  
  # A nice way to help the views tell if you are on the current page you want to be on.
  def current_view(params, options = {})
    valid = true
    
    results = options[:result]

    options.each do |option|
      for param in params
        if param[0].to_s == option[0].to_s
          unless param[1].to_s == option[1].to_s 
            valid = false
          end
        end
        if options[:ignore]
          options[:ignore].each do |ignore|
            if param[0].to_s == ignore[0].to_s && param[1].to_s == ignore[1].to_s
              valid = false
            elsif ignore[0].to_s == param[0].to_s && ignore[1].to_s == "all"
              valid = false
            end
          end
        end
      end
    end
    if results.blank?
      return valid
    elsif valid
      return results
    end
  end
  
  def set_focus(id)    
    return content_tag(:script, "$('##{id}').focus();", :type => "text/javascript")
  end
end
