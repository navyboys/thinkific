module Api
  module V1
    class IntegersController < ApplicationController
      protect_from_forgery with: :null_session

      before_action :restrict_access

      def reset
        if integer?(params[:current])
          value = params[:current].to_i
          save_integer(value)
          render json: { status: 'success', integer: value }
        else
          render json: { status: 'failed', message: 'Please reset with an integer.' }
        end
      end

      def current
        render json: { status: 'success', integer: current_integer }
      end

      def next
        save_integer(current_integer.next)
        render json: { status: 'success', integer: current_integer }
      end

      private

      def integer?(data)
        /\A[-+]?\d+\z/ === data
      end

      def restrict_access
        if request.headers["HTTP_AUTHORIZATION"]
          authenticate_or_request_with_http_token do |token, options|
            User.exists?(token: token)
          end
        else
          api_key = User.find_by_token(params[:token])
          head :unauthorized unless api_key
        end
      end
    end
  end
end
