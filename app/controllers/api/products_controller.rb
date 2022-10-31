class Api::ProductsController < ApplicationController
  def index
    case params[:category]
    when 'undefined'
      @products = Product.all
    when 'light-medium-dark-roasts'
      @products = Product.where("category = 'light-medium-dark-roasts'")
    when 'decaf-coffee'
      @products = Product.where("category = 'decaf-coffee'")
    when 'flavored-coffee'
      @products = Product.where("category = 'flavored-coffee'")
    when 'coffee-pods'
      @products = Product.where("category = 'coffee-pods'")
    when 'health-boosters'
      @products = Product.where("category = 'health-boosters'")
    end
    render :index
  end

  def show
    @product = Product.find_by_id(params[:id])
    render :show
  end
end
