class OrdersController < ApplicationController
  protect_from_forgery
  before_action :set_order, only: [:destroy]

  # GET /orders
  def index
    @orders = Order.where(:active => true)
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @confirm=Confirm.new(params.require(:order).permit(:restaurant, :quantity, :price, :order_date, :min_cost, :tot_cost))
    @user=User.find_by_access_token(request.headers["HTTP_ACCESS_TOKEN"])
    if @order.save
      @order.users_id=@user.id
      @order.admin_name=@user.name
      @order.admin_address=@user.address
      @order.restaurant=@order.restaurant.downcase.titleize
      @order.save
      @success={:success => true, :errors => nil, :order_id => @order.id}
    else
      @success={:success => false, :errors => @order.errors, :order_id => :null}
    end
  end

  # DELETE /orders/:id
  # called when order expires
  #TODO:gcm request to be sent-khana aa gya
  def destroy
    if @order.nil?
      @success={:success => false, :error => @user.errors}
    else
      @order.active= false
      @order.save
      @success={:success => true, :error => nil}
    end
    render json: @success
  end

  # GET /orders/restaurants to return restaurants list
  def restaurant_list
    @restaurants=Order.uniq.pluck(:restaurant)
    render json: @restaurants
  end

  # POST /orders/restaurant_order/:restaurant
  # orders of this restaurant
  def restaurant_orders
    @orders=Order.where(:restaurant => params[:restaurant], :active => true)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:restaurant, :item, :quantity, :price, :order_date, :min_cost, :tot_cost)
  end
end
