require 'spec_helper'

describe Privateer::Connection do
  describe '.new' do
    let(:valid_options) { {store_name: 'test', api_key: 'testkey', password: 'secret'}}

    it 'accepts valid options' do
      Privateer::Connection.new(valid_options).must_be_instance_of Privateer::Connection
    end

    it 'raises ArgumentError on missing store_name' do
      lambda {
        Privateer::Connection.new(api_key: 'testkey', password: 'secret')
      }.must_raise ArgumentError
    end

    it 'raises ArgumentError on missing api_key' do
      lambda {
        Privateer::Connection.new(store_name: 'test', password: 'secret')
      }.must_raise ArgumentError
    end

    it 'raises ArgumentError on missing password' do
      lambda {
        Privateer::Connection.new(store_name: 'test', api_key: 'testkey')
      }.must_raise ArgumentError
    end
  end
end
