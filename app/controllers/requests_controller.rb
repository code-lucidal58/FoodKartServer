class RequestsController < ApplicationController
  protect_from_forgery
  before_action :set_request, only: [:show, :update]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(:accept => false)
  end

  # GET /requests/1
  # GET /requests/1.json
  # def show
  # end

  # # GET /requests/new
  # def new
  #   @request = Request.new
  # end

  # # GET /requests/1/edit
  # def edit
  # end

  # POST /requests
  # POST /requests.json
  def create
    @req = Request.new(request_params)
    begin
      @user=User.find_by_access_token(request.headers["HTTP_ACCESS_TOKEN"])
      @req.users_id=@user.id
      @req.save
      @success={:success => true, :errors => ""}
    rescue ActiveRecord::RecordNotFound => e
      @success={:success => false, :errors => @user.errors}
    end
    render json: @success
  end

  # PATCH/PUT /requests/:id
  def update
    @request.accept=true
    @request.save
    @success={:success=>true}
    render json: @success
  end

  # DELETE /requests/1
  # def destroy
  #   @request.destroy
  #   respond_to do |format|
  #     format.json { head :no_content }
  #   end
  # end

  # POST /requests/retrieve_request
  def retrieve_request
    @requests=Request.where(:orders_id => params[:orders_id]).where(:accept => false)
    # if @requests.nil?
    #   @success={:success=> false, :errors => "No pending requests"}
    # else
    #  @success = {:success => true, :errors=>""}
    #end
    render json: @success
  end

  #POST /requests/confirm_orders
  def confirm_order
    @order=Order.find(params[:orders_id])
    @requests=Request.where(:orders_id => params[:orders_id], :accept => true)
    @confirm={:order=> @order, :requests=>@requests}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:orders_id, :item, :quantity, :price)
  end
end
