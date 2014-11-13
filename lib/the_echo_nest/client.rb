require_relative 'http_client'

module TheEchoNest

    class Client

        def artists
          TheEchoNest::Artists.new
        end

    end

end
