class AboutController < ApplicationController
  def index
    @category = Category.all
  end
end
