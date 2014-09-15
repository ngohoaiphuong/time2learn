class Admin::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.new(params_for_registration)
    if @user.save
      render nothing: true
      return
    end

    if @user.errors[:email].present? && User.where(email: @user.email).first
      render json: {error: "Email #{@user.errors[:email][0]}"}, status: 401
      return
    end

    if @user.errors[:password].present?
      render json: {error: "Password #{@user.errors[:password][0]}"}, status: 401
      return
    end

    render json: {error: "Something errors"}, status: 401
  end

  protected

  def params_for_registration
    params.slice(:email, :password, :password_confirmation, :username, :role)
  end

end