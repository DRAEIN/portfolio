class PortfolioPagesController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
  	@portfolio_item = PortfolioPage.all
  end

  def angular
    @angular = PortfolioPage.angular
  end

  def new
  	@portfolio_item = PortfolioPage.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
  	@portfolio_item = PortfolioPage.new(portfolio_params)

  	respond_to do |format|
  		if @portfolio_item.save
  			format.html { redirect_to portfolios_path , notice: 'Your Portfolio Item is now live' }
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
  			format.html { redirect_to portfolio_show_path , notice: 'Your Portfolio Item has been successfully updated!'}
  		else
  			format.html { render :edit }
  		end
  	end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Item was successfully removed.' }
    end
  end


  private

  def portfolio_params
  	params.require(:portfolio_page).permit(:title, 
                                           :subtitle, 
                                           :body, 
                                           technologies_attributes: [:name]
                                           )
  end

  def set_portfolio_item
    @portfolio_item = PortfolioPage.find(params[:id])
  end
end

