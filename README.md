EchoNest API client prototype
=============================

This is basically a proof of concept, working around the /artist/search and /artist/profile end-points.

It's actually really easy to extend to it can became pretty useful if I put some effort into it.

So far it lets you search artists by any cretiria, get a collection back and fetch all/some attributes of any of them by demand.

Tests are in place, going over every public method, obviposly not testing all the eadge cases. Adding API mocks would be good too (right now they relay on the developer sandbox).

Also some of the config values (base url and token) should be loaded from config files (right now hard-coded on lib/the_echo_nest/http_client.rb).

Let me show you some usage examples:

```ruby
    require 'the_echo_nest'

    client = TheEchoNest::Client.new

    results = client.artists.where(name:'The Cure', artist_location:'country:United+Kingdom').search 
    # same as client.artists.where(name:'The Cure').where(artist_location:'city:United+Kingdom').search

    artist = results.first
    
    artist.name #=> 'The Cure'
    artist.artist_location #=> Method Missing Exception

    artist.fetch(['discovery', 'songs']) # Fetching just discovery and genere
    artist.discovery #=> 0.3128279090025211
    artist.artist_location #=> Methos Missing again

    artist.fetch #=> Fetching the whole set of attributes available
    artist.fetch.artist_location #=> {"city"=>"Crawley", "region"=>"England", "location"=>"Crawley, England, GB", "country"=>"United Kingdom"}
```    
