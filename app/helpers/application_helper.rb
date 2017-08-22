module ApplicationHelper
  def login_helper
	if current_user.is_a?(GuestUser) 
    concat link_to 'Login', new_user_session_path 
    link_to 'Register', new_user_registration_path
  else 
    link_to 'logout', destroy_user_session_path, method: :delete 
    end 
  end

  def source_helper
  	if session[:source]
  	  greetings = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greetings, class: "source-greeting")
    end 
  end

end
