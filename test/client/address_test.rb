$:.unshift File.dirname(__FILE__) + '/../' # allows command line to execute tests
require 'helper'

class AddressTest < Test::Unit::TestCase

  context '#clean_address' do
    setup {stub_post('AuthenticateUser') }

    context 'with valid data' do
      setup do
        stub_post('CleanseAddress')
        @address = Stamps.clean_address
      end
      should 'return the clean address' do
        assert_equal 'MATT SEARS', @address.address.full_name
        assert_equal 'MATT SEARS', @address.address.full_name
      end
      should 'return a cleanse hash' do
        assert @address.address.cleanse_hash
      end
      should 'indicate if the address match' do
        assert @address.address_match
        assert @address.city_state_zip_ok
      end
    end

  end

end
