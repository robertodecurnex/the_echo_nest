module TheEchoNest

    # A proxy to the artist API end-points
    class Artists < HttpClient

        def initialize
            @filters = {}
        end

        # Returns the list of stored filters.
        #
        # @return [<Strings>] the stored filters.
        def filters
            return @filters
        end
        
        # Triggers the HTTP request to the artist/search end-point using the stored filters.
        # Returns a collection of Artist
        #
        # @return [<TheEchoNest::Artist>] a collection of Artist matching the given filters
        def search
            self.class.get('/api/v4/artist/search', {query: self.request_params(@filters)}).to_hash['response']['artists'].collect do |data|
                TheEchoNest::Artist.new  data   
            end
        end

        # Adds filters to the list of search filters.
        # Returns the instance, enabling chained methods.
        #
        # @param [{Symbol=>String}] conditions the collection of filters to add.
        # @return [Artists] the Artists instance.
        def where conditions
            @filters.merge! conditions
            return self
        end

    end

end
