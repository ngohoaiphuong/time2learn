class Admin::DataController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def show
    @user = User.find_by_id(params[:id])
  end

  def index    
    @user = User.all    
  end

  def destroy    
    @user = User.find_by_id(params[:id])
    if @user
      @user.destroy
      render nothing: true
      return
    end
    render nothing: true, status: 401   
  end

  def update
    @user = User.find_by_id(params[:id])    
    if !@user
      render json: {error: 'Can\'t found this user need update.'}, status: 401  
      return
    end
    
    @user.update_attributes(resource_params)
    if @user.errors.empty?
      render nothing: true
      return
    end

    render json: {error: @user.errors.full_messages}, status: 401
  end

  protected
  def resource_params
    params.slice(:email, :username, :role)
  end  
end
