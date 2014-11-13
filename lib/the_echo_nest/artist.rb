module TheEchoNest

    # EchoNest Artist
    class Artist < HttpClient

        BUCKET = %w(biographies blogs discovery discovery_rank doc_counts familiarity familiarity_rank genre hotttnesss hotttnesss_rank images artist_location news reviews songs terms urls video years_active)
    
        def initialize(data)
            @name = data['name']
            @remote_id = data['id']
            @data = {}
        end

        # Fetch the Artist information from the /artist/profile end-point.
        # It will fetch every abailable attribute unless a template is given.
        # If a template is given, it will only fetch the requested fields.
        # Returns the instance, to enable chained methods.
        #
        # @param [FalseClass|<String>] template an array of requested attributes to fetch. 
        # @return [TheEchoNest::Artist] 
        def fetch template=false
            @data = self.class.get('/api/v4/artist/profile', {query: self.request_params({id: @remote_id, bucket: template || TheEchoNest::Artist::BUCKET})}).to_hash['response']['artist']
            return self
        end

        # Returns the Artist name
        #
        # @return [String] the Artist name
        def name
            return @name
        end

        # Returns the availability of the method based on the fetched information.
        def response_to? method
            @data.keys.include? method.to_s || super
        end

        # Extends the Artists giving access to the fetched attributes as methods.
        # Examples: 
        #   artist.genre
        #   artist.discovery
        def method_missing method, *args, &block
            if @data.keys.include? method.to_s
                return @data[method.to_s]
            end
            super
        end

    end

end
