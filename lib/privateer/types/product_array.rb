require 'thread'
class Privateer::Types::ProductArray
  attr_reader :count

  def initialize(connection, params = {})
    @mutex = Mutex.new

    @connection = connection
    @params = params
    @products = []

    @count = get_count

    if params[:limit].nil? && params[:page].nil?
      get_all_products(params)
    else
      get_products(@params)
    end

    self
  end

  alias_method :size, :count

private
  def get_count
    status, body, response = @connection.get('products/count', @params)
    raise Privateer::Errors::UnexpectedResponse unless status == 200
    body['count'].to_i
  end

  def get_all_products(params)
    pages = @count / 250
    pages += 1 if @count / 250 > 0

    params[:limit] = 250

    pages.times do |page|
      params[:page] = page + 1
      get_products(params)
    end
  end

  def get_products(params)
    status, body, response = @connection.get('products', params)
    raise Privateer::Errors::UnexpectedResponse unless status == 200
    populate_products(body['products'])
  end

  def populate_products(products)
    products.each do |product_info|
      @mutex.synchronize { @products << Privateer::Product.new(@connection, product_info) }
    end
  end
end
