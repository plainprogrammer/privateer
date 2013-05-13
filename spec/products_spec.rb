require 'spec_helper'

describe Privateer::Connection do
  let(:connection) { Privateer::Connection.new(VALID_OPTIONS) }

  describe '#products' do
    it 'returns a Privateer::Types::ProductArray' do
      connection.products.must_be_instance_of Privateer::Types::ProductArray
    end

    describe '.size' do
      it 'returns an Integer' do
        connection.products.size.must_be_instance_of Fixnum
      end
    end
  end
end
