class Api::CartItemsController < ApplicationController
    def index
        @cart_items = CartItem.all
        render :index
    end

    def show
        @cart_item = CartItem.find_by_id(params[:id])
        render :show
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        if @cart_item.save
            render :show
        else 
            render json: @cart_item.errors.full_messages, status: 422
        end
    end

    def update
        @cart_item = CartItem.find_by_id(params[:id])
        if @cart_item&.update(cart_item_params)
            render :show
        else   
            render json: @cart_item.errors.full_messages, status: 422
        end
    end

    def destroy
        @cart_item = CartItem.find_by_id(params[:id])
        @cart_item.destroy
        render :show
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :size, :price, :shopper_id, :product_id)
    end
end
