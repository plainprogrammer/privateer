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

  def get(target, params = {})
    resp = @connection.get(target, params)
    return resp.code, resp.body, resp
  end

  def post(target, params = {})
    resp = @connection.post(target, params)
    return resp.code, resp.body, resp
  end

  def put(target, params = {})
    resp = @connection.put(target, params)
    return resp.code, resp.body, resp
  end

  def delete(target, params = nil)
    resp = @connection.delete(target, params)
    return resp.code, resp.body, resp
  end
end
