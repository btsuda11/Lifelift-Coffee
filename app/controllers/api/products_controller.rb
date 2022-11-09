class Api::ProductsController < ApplicationController
  def index
    case params[:category]
    when 'undefined'
      @products = Product.all
    when 'All Products'
      @products = Product.all
    when 'Light Medium Dark Roasts'
      @products = Product.where("category = 'Light Medium Dark Roasts'")
    when 'Decaf Coffee'
      @products = Product.where("category = 'Decaf Coffee'")
    when 'Flavored Coffee'
      @products = Product.where("category = 'Flavored Coffee'")
    when 'Coffee Pods'
      @products = Product.where("category = 'Coffee Pods'")
    when 'Health Boosters'
      @products = Product.where("category = 'Health Boosters'")
    end
    render :index
  end

  def show
    @product = Product.where('name ILIKE (?)', capitalize_name(params[:product_name]))
    render :show
  end
end
