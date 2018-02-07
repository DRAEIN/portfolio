class PagesController < ApplicationController
  def home
  	 @blog = Blog.all
  	 @skills = Skill.all
  	 @portfolio = PortfolioPage.all
  end

  def about
  	@skills = Skill.all
  end

  def contact
  end
end
