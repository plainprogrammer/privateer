class Privateer::Connection
  def initialize(options = {})
    raise ArgumentError, 'store_name is required' if options[:store_name].nil?
    raise ArgumentError, 'api_key is required' if options[:api_key].nil?
    raise ArgumentError, 'password is required' if options[:password].nil?

    @store_name = options[:store_name]
    @api_key = options[:api_key]
    @password = options[:password]

    @store_url = "https:://#{@api_key}:#{@password}@#{@store_name}.myshopify.com/admin/"

    @connection = Faraday.new(url: @store_url)
  end

  def get(target, params = nil)

  end

  def post(target, params = nil)

  end

  def put(target, params = nil)

  end

  def delete(target, params = nil)

  end
end
