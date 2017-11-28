module ApplicationHelper
  def login_helper style = ''
	if current_user.is_a?(GuestUser) 
    concat link_to 'Login', new_user_session_path, class: style
    link_to 'Register', new_user_registration_path, class: style
  else 
    link_to 'logout', destroy_user_session_path, method: :delete, class: style
    end 
  end

  def source_helper
  	if session[:source]
  	  greetings = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greetings, class: "source-greeting")
    end 
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
  
    {
        url: contact_path,
        title: 'Contact Me'
      },
    
    {
        url: blogs_path,
        title: 'My Blog'
      },
    
    {
        url: portfolios_path,
        title: 'My Portfolio'
      },
    
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end




    nav_links.html_safe    
  end

  def active? path 
    "active" if current_page? path
  end

end
