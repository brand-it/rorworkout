module UsersHelper
   def access_level_types_for_select
   	# ['Unknow', 2], ['Faculty', 4]
    [['Select Access Level', 0], ['Basic', 1], ['Client', 2], ["Colaborator", 4], ['Admin', 8]]
  end
  
  
  
  # Used numbers for athorization should be using words
   def admin?
     authorization([8])
   end

   def client?
     authorization([2, 4, 8])
   end
   
   
   def colaborator?
     authorization([4, 8])
   end

   def logged_in?
     if current_user
       return true
     else
       return false
     end
   end


   def authorization(levels)
     granted = false

     for level in levels
       if self.current_user and self.current_user.access_level == level
         granted = true
       end
     end
     return granted
   end

   def textilize(text, *options)
     options ||= [:hard_breaks]

     if text.blank?
       ""
     else
       textilized = RedCloth.new(text, options)
       textilized.to_html.html_safe
     end
   end
   
   
   def access_level_to_words(access_level)
      if access_level == 0
      	return "Deactivated"
  	  elsif access_level == 1
  		  return "Basic"
  		elsif access_level == 2
  		  return "Client"
  		elsif access_level == 4
  		  return "Colaborator"
      elsif access_level == 8
  	    return "Admin"
      end
    end
end
