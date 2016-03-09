class UsersController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: [:update, :destroy, :logout]

  # GET /users
  def index
    @users = User.where(:active => true)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        salt = BCrypt::Engine.generate_salt
        @user.salt=salt
        @user.password = Digest::SHA2.hexdigest(salt + @user.password)
        @user.access_token=Digest::SHA1.hexdigest([Time.now, rand].join)
        @user.save
        @success={:success => true, :error => nil, :access_token => @user.access_token}
        format.json { render json: @success, status: :ok }
      else
        @success={:success => false, :error => @user.errors, :access_token => nil}
        format.json { render json: @success, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users
  def update
    if @user.nil?
      @success={:success => false, :error => "user does not exist"}
      render json: @success
    else
      if @user.update(params.require(:user).permit(:name, :email, :phone, :gender, :address, :dob, :gcm_reg_no, :photo_url))
        @success={:success => true, :error => nil}
        render json: @success, status: :ok
      else
        @success={:success => false, :error => @user.errors}rails
        render json: @success, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users
  def destroy
    if @user.nil?
      @success={:success => false, :error => "user does not exist"}
    else
      @user.access_token= nil
      @user.active= false
      @user.save
      @success={:success => true, :error => nil}
    end
    render json: @success
  end

  ###### User Defined Functions #####
  # POST /users/login
  def login
    @user= User.where(:email => params[:email], :active => true)
    if @user.nil?
      @success={:success => false, :error => "email id does not exist", :access_token => nil}
    else
      if @user.password == Digest::SHA2.hexdigest(@user.salt + params[:password])
        @user.access_token=Digest::SHA1.hexdigest([Time.now, rand].join)
        @user.save
        @success={:success => true, :error => nil, :access_token => @user.access_token}
      else
        @success={:success => false, :error => "password does not match", :access_token => nil}
      end
    end
    render json: @success
  end

  #GET /users/logout
  def logout
    @user.access_token= nil
    @user.save
    @success={:success => true, :error => nil}
    render json: @success
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user=User.where(:access_token => request.headers["HTTP_ACCESS_TOKEN"], :active => true)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :phone, :gender, :address, :dob, :gcm_reg_no, :photo_url, :password, :active)
  end
end
