class PortfolioPagesController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show]
  

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

  def show

  end

  def edit
  end

  def update
  	respond_to do |format|
  		if @portfolio_item.update(portfolio_params)
  			format.html { redirect_to portfolio_pages_path , notice: 'Your Portfolio Item has been successfully updated!'}
  		else
  			format.html { render :edit }
  		end
  	end
  end

  def delete
  end


  private

  def portfolio_params
  	params.require(:portfolio_page).permit(:title, :subtitle, :body)
  end

  def set_portfolio_item
    @portfolio_item = PortfolioPage.find(params[:id])
  end
end

