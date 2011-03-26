# encoding: utf-8
require 'httparty'
require 'json'

module DeviseLoginza

  class Loginza
    include HTTParty

    base_uri 'http://loginza.ru'

    class << self

      def auth(token)
        response = get('/api/authinfo', :query => { :token => token})

        raise ServiceUnavailableError, "The Loginza service is temporarily unavailable. (4XX)" if response.code >= 400
        @data = JSON.parse(response.body)

        {
          :auth_state   => (@data.keys.join =~ /error/ ? :error : :ok),
          :data         => @data
        }
      rescue Exception => e
        ::Rails.logger.info("Error parse: #{response.body}")
        ::Rails.logger.error(e)
        return { }
      end

    end # end class <<self
  end
end
