class AddPositionToPortfolioPages < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolio_pages, :position, :integer
  end
end
