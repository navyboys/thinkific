# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Google')
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to root_url, alert: @user.errors.full_messages.join('\n')
      end
    end

    protected

    def after_omniauth_failure_path_for(scope)
      root_path(scope)
    end

    def after_sign_in_path_for(_resource)
      root_path
    end
  end
end
