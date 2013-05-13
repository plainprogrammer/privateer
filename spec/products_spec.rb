require 'spec_helper'

describe Privateer::Connection do
  let(:connection) { Privateer::Connection.new(VALID_OPTIONS) }

  describe '#products' do
    it 'returns a Privateer::Types::ProductArray' do
      connection.products.must_be_instance_of Privateer::Types::ProductArray
    end
  end
end
