require_relative '../spec_helper'

describe TheEchoNest::Artists do

    let :artists do
        TheEchoNest::Client.new.artists
    end

    describe '#where' do
        
        it 'should return the instance (to allow chained methods)' do
            expect(artists.where(name:'The Cure')).to be_equal artists
            expect(artists.filters).to include :name
            expect(artists.filters[:name]).to eq 'The Cure'
        end

    end

    describe '#search' do

        it 'should return a collection of TheEchoNest::Artist' do
            expect(artists.where(name:'The Cure').search).to all (be_instance_of TheEchoNest::Artist)
        end
    end

end
