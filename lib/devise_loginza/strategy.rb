# encoding: utf-8
require 'devise/strategies/base'

module Devise
  module Strategies
    class LoginzaAuthenticatable < Base

      def authenticate!
        logger.debug("Authenticating with Loginza for mapping #{mapping.to}")
        if provider_response
          handle_response!
        else
          fail(:invalid_token)
        end
      end

      protected

      def handle_response!
        logger.debug "Attempting Loginza auth: #{provider_response.inspect}"
        loginza_result = ::DeviseLoginza::Loginza.auth(provider_response)

        case loginza_result[:auth_state]
        when :ok
          resource = if Devise.loginza_auto_register && mapping.to.respond_to?(:create_from_loginza)
                       mapping.to.send(:create_from_loginza, loginza_result[:data])
                     else
                       mapping.to.find_by_email(loginza_result[:data]["email"])
                     end
          if resource
            success!(resource)
          else
            fail! I18n.t("devise.loginza.user_not_registered")
          end

        else
          fail! "Loginza: #{loginza_result[:data]}"
        end
      end

      private

      def provider_response?
        !!provider_response
      end

      def provider_response
        params[:token]
      end

      def logger
        @logger ||= Rails.logger
      end

    end
  end
end

Warden::Strategies.add :loginza_authenticatable, Devise::Strategies::LoginzaAuthenticatable
