require 'spec_helper'

describe Privateer::Types::ProductArray do
  let(:connection) { Privateer::Connection.new(VALID_OPTIONS) }
  let(:product_array) { Privateer::Types::ProductArray.new(connection) }

  describe '.new' do
    it 'raises ArgumentError on missing connection' do
      lambda {
        Privateer::Types::ProductArray.new
      }.must_raise ArgumentError
    end

    it 'accepts parameters' do
      Privateer::Types::ProductArray.new(connection, {limit: 5}).must_be_instance_of Privateer::Types::ProductArray
    end
  end

  describe '#count' do
    it 'returns an Integer' do
      product_array.count.must_be_instance_of Fixnum
    end
  end

  describe '[]' do

  end

  describe '<<' do

  end

  describe '[]=' do

  end
end
