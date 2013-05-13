require 'spec_helper'

describe Privateer::Types::ProductArray do
  let(:connection) { Privateer::Connection.new(VALID_OPTIONS) }
  let(:product_array) { Privateer::Types::ProductArray.new(connection) }

  it 'raises ArgumentError on missing connection' do
    lambda {
      Privateer::Types::ProductArray.new
    }.must_raise ArgumentError
  end

  it 'accepts parameters'

  describe '.count' do
    it 'returns an Integer' do
      product_array.count.must_be_instance_of Fixnum
    end
  end
end
