class Admin::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless user

    if user.valid_password?(params[:password])
      sign_in("user", user)
      render nothing: true
      return
    end

    invalid_login_attempt
  end

  def destroy
    sign_out('user')
    render nothing: true
  end

  protected

  def invalid_login_attempt
    warden.custom_failure!
    render json: {error: 'Invalid login'}, status: 401
  end

end
