module Api
  module V1
    class IntegersController < ApplicationController
      protect_from_forgery with: :null_session

      before_action :restrict_access

      def reset
        if integer?(params[:current])
          value = params[:current].to_i
          save_value(value)
          render json: { status: 'success', integer: value }
        else
          render json: { status: 'failed', message: 'Please reset with an integer.' }
        end
      end

      def current
        render json: { status: 'success', integer: current_value }
      end

      def next
        save_value(current_value.next)
        render json: { status: 'success', integer: current_value }
      end

      private

      def integer?(data)
        /\A[-+]?\d+\z/ === data
      end

      def save_value(value)
        @thinkific_integer.content = value
        @thinkific_integer.save
      end

      def current_value
        @thinkific_integer.content
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          User.exists?(token: token)
        end
      end
    end
  end
end
