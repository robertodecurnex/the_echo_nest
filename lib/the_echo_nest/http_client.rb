require 'httparty'

module TheEchoNest

    class HttpClient

        include HTTParty
        # Should be loaded to config file.
        base_uri 'developer.echonest.com'
        format :json
        # This lets HTTParty send multiple values for the same key on the same request.
        disable_rails_query_string_format

        # Default request params, needed for every end-point
        #
        # @returns [{Symbol=>String}] default request params.
        DEFAULT_REQUEST_PARAMS = {
            format:'json', 
            api_key:'secretsecret'
        }

        # Merge and return the given parms plus the default ones.
        #
        # @param [{Symbol=>String}] params the request custom params
        # @return [{Symbol=>String}] the full list of request parameters
        def request_params params={}
            return TheEchoNest::HttpClient::DEFAULT_REQUEST_PARAMS.merge params 
        end

    end

end
