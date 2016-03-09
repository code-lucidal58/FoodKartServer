class ConfirmsController < ApplicationController
  protect_from_forgery
  before_action :set_confirm, only: [:show, :edit, :update, :destroy]

  # GET /confirms
  def index
    @confirms = Confirm.all
  end

  # GET /confirms/1
  def show
  end

  # GET /confirms/new
  def new
    @confirm = Confirm.new
  end

  # GET /confirms/1/edit
  def edit
  end

  # POST /confirms
  def create
    @confirm = Confirm.new(confirm_params)

    respond_to do |format|
      if @confirm.save
        format.html { redirect_to @confirm, notice: 'Confirm was successfully created.' }
        format.json { render :show, status: :created, location: @confirm }
      else
        format.html { render :new }
        format.json { render json: @confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirms/1
  def update
    respond_to do |format|
      if @confirm.update(confirm_params)
        format.html { redirect_to @confirm, notice: 'Confirm was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirm }
      else
        format.html { render :edit }
        format.json { render json: @confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirms/1
  def destroy
    @confirm.destroy
    respond_to do |format|
      format.html { redirect_to confirms_url, notice: 'Confirm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirm
      @confirm = Confirm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirm_params
      params.fetch(:confirm, {})
    end
end
