require 'oauth'
require 'json'

module Bricklink
  class Client
    BASE_URL = 'https://api.bricklink.com/api/store/v1'

    AUTH_PARAMS = %w(consumer_key consumer_secret token token_secret)

    AUTH_PARAMS.each do |param|
      define_method(param) { ENV["BRICKLINK_#{param}".upcase] }
    end

    def get_item item_number
      call_api "/items/SET/#{item_number}"
    end

    def get_price_guide item_number, options = {}
      call_api "/items/SET/#{item_number}/price", options
    end

    protected

    def call_api path, params = {}
      response = access_token.get([path, URI.encode_www_form(params)].join('?'))

      if response.is_a? Net::HTTPOK
        JSON.parse(response.body)
      else
        raise response.body
      end
    end

    def access_token
      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, { site: BASE_URL })
      access_token = OAuth::AccessToken.new(consumer, token, token_secret)
    end
  end
end
