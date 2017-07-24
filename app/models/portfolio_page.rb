class PortfolioPage < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle: 'Angular')
	end

	after_initialize :set_defaults  #after making a new instance of a Portfolioitem,
                                     #it will check with action beneath, if theres an image given,
                                      #if not, place a placeholderimage as deault

	def set_defaults  
		self.main_image ||= "http://via.placeholder.com/600x400"
		self.thumb_image ||= "http://via.placeholder.com/350x200"
	end

	
end
