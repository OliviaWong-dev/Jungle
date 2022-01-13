class Admin::DashboardController < ApplicationController
  def show
    @total_categories = Category.count
    @total_products = Product.count
  end
end
