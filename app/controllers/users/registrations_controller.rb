# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery except: :create

  # POST /resource
  def create
    if params[:commit]
      super
    else
      @user = User.new(user_params)
      if @user.save
        render json: { status: 'success', api_key: @user.token }
      else
        render json: { status: 'failed', message: @user.errors }
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
