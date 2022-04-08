class Admin::DashboardController < ApplicationController
  def show
    @product = Product.all
    @category = Category.all
  end
end
