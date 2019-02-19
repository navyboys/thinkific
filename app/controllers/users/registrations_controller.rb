# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery except: :create

  # POST /resource
  def create
    if params[:commit]
      super
    else
      begin
        user = User.create!(
          email: params['email'],
          password: params['password']
        )
        render json: { status: 'success', api_key: user.token }
      rescue StandardError => e
        render json: { status: 'failed', message: e.message }
      end
    end
  end
end
