require_relative '../spec_helper'

describe TheEchoNest::Client do
        
    let :client do
      TheEchoNest::Client.new
    end

    describe '#artists' do
   
        it 'should return a TheEchoNest::Artists instance' do
            expect(client.artists).to be_instance_of TheEchoNest::Artists
        end

    end

end
