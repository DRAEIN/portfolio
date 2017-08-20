module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
  	before_filter :set_page_defaults
  end
  
  def set_page_defaults
  	@page_title = "Mark Billes | Personal Website"
  	@seo_keywords = "Mark Billes Portfolio"
  end
end