class PortfolioPagesController < ApplicationController

  def index
  	@portfolio_item = PortfolioPage.all
  end

  def new
  	@portfolio_item = PortfolioPage.new
  end

  def create
  	@portfolio_item = PortfolioPage.new(portfolio_params)

  	respond_to do |format|
  		if @portfolio_item.save
  			format.html { redirect_to portfolio_pages_path , notice: 'Your Portfolio Item is now live' }
  		else
  			format.html { render :new }
  		end
  	end
  end


  private

  def portfolio_params
  	params.require(:portfolio_page).permit(:title, :subtitle, :body)
  end
end

