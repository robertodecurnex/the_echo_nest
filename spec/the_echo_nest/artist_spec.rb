require_relative '../spec_helper'

describe TheEchoNest::Artist do

    let :artist do 
        TheEchoNest::Client.new.artists.where(name:'The Cure').search.first
    end

    describe '#name' do
        
        it 'should return the artist name' do
            expect(artist.name).to eq 'The Cure'
        end

    end
    
    describe '#fetch' do
        
        it 'should fetch and store every attribute of the artist' do
            expect(artist.fetch).to equal artist
            expect(artist.artist_location).to eq({
                "city"      =>  "Crawley", 
                "region"    =>  "England",
                "location"  =>  "Crawley, England, GB", 
                "country"   =>  "United Kingdom"
            })
        end

    end

end
