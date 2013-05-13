require 'spec_helper'

describe Privateer::Connection do
  let(:connection) { Privateer::Connection.new(VALID_OPTIONS) }

  describe '.new' do
    it 'accepts valid options' do
      connection.must_be_instance_of Privateer::Connection
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

  describe '#get' do
    it 'raises Argument Error on missing target' do
      lambda {
        connection.get
      }.must_raise ArgumentError
    end

    it 'accepts parameters' do
      connection.get('products', {collection_id: 1})
    end

    it 'returns a valid response' do
      code, body, resp = connection.get('products')
      code.must_equal 200
      body.wont_be_nil
      resp.must_be_instance_of Faraday::Response
    end
  end

  describe '#post' do
    it 'raises Argument Error on missing target' do
      lambda {
        connection.post
      }.must_raise ArgumentError
    end
  end

  describe '#put' do
    it 'raises Argument Error on missing target' do
      lambda {
        connection.put
      }.must_raise ArgumentError
    end
  end

  describe '#delete' do
    it 'raises Argument Error on missing target' do
      lambda {
        connection.delete
      }.must_raise ArgumentError
    end
  end
end
