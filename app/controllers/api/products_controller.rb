class Api::ProductsController < ApplicationController
  def index
    case params[:category]
    when 'undefined'
      @products = Product.all
    when 'All Products'
      @products = Product.all
    when 'Light Medium Dark Roasts'
      @products = Product.select('distinct(name)', 'image_url').where("category = 'Light Medium Dark Roasts'")
    when 'Decaf Coffee'
      @products = Product.select('distinct(name)', 'image_url').where("category = 'Decaf Coffee'")
    when 'Flavored Coffee'
      @products = Product.select('distinct(name)', 'image_url').where("category = 'Flavored Coffee'")
    when 'Coffee Pods'
      @products = Product.select('distinct(name)', 'image_url').where("category = 'Coffee Pods'")
    when 'Health Boosters'
      @products = Product.select('distinct(name)', 'image_url').where("category = 'Health Boosters'")
    end
    render :index
  end

  def show
    @product = Product.where('name ILIKE (?)', capitalize_name(params[:name]))
    render :show
  end

  private
  def capitalize_name(words)
    words.split('-').map { |word| word.capitalize }.join(' ')
  end
end
