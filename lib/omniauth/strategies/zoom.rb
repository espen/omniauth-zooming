require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Zoom < OmniAuth::Strategies::OAuth2
      option :name, "zoom"
      option :client_options, {
        token_url: "https://zoom.us/oauth/token",
        authorize_url: "https://zoom.us/oauth/authorize",
        site: "https://zoom.us"
      }

      info do
        {
          :name => raw_info['Name'],
          :email => raw_info['Email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      credentials do
        hash = {'token' => access_token.token}
        hash.merge!('refresh_token' => access_token.refresh_token) if access_token.refresh_token
        hash.merge!('expires_at' => access_token.expires_at ) if access_token.expires?
        hash.merge!('expires' => access_token.expires?)
        hash
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/users/me').parsed
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end

    end

  end
end

OmniAuth.config.add_camelization 'zoom', 'Zoom'