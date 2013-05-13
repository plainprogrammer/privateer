require 'spec_helper'

describe Privateer::Connection do
  let(:connection) { Privateer::Connection.new(VALID_OPTIONS) }
  let(:product_hash) {
    {
        product: {
            title: "Burton Custom Freestlye 151",
            body_html: "<strong>Good snowboard!</strong>",
            vendor: "Burton",
            product_type: "Snowboard",
            variants: [
                {
                    option1: "First",
                    price: "10.00",
                    sku: 123
                },
                {
                    option1: "Second",
                    price: "20.00",
                    sku: "123"
                }
            ]
        }
    }
  }

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

    it 'accepts parameters' do
      connection.post('products', product_hash)
    end

    it 'returns a valid response' do
      code, body, resp = connection.post('products', product_hash)
      code.must_equal 201
      body.wont_be_nil
      resp.must_be_instance_of Faraday::Response
    end
  end

  describe '#put' do
    let(:update_hash) {
      {
        product: {
          id: @product_id,
          published: true
        }
      }
    }

    before :each do
      code, body, resp = connection.post('products', product_hash)
      @product_id = body['product']['id']
    end

    it 'raises Argument Error on missing target' do
      lambda {
        connection.put
      }.must_raise ArgumentError
    end

    it 'accepts parameters' do
      connection.put("products/#{@product_id}", update_hash)
    end

    it 'returns a valid response' do
      code, body, resp = connection.put("products/#{@product_id}", update_hash)
      code.must_equal 200
      body.wont_be_nil
      resp.must_be_instance_of Faraday::Response
    end
  end

  describe '#delete' do
    before :each do
      code, body, resp = connection.post('products', product_hash)
      @product_id = body['product']['id']
    end

    it 'raises Argument Error on missing target' do
      lambda {
        connection.delete
      }.must_raise ArgumentError
    end

    it 'accepts parameters' do
      connection.delete("products/#{@product_id}", {collection_id: 1})
    end

    it 'returns a valid response' do
      code, body, resp = connection.delete("products/#{@product_id}")
      code.must_equal 200
      body.wont_be_nil
      resp.must_be_instance_of Faraday::Response
    end
  end
end
