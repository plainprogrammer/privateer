class Privateer::Connection
  def initialize(options = {})
    raise ArgumentError, 'store_name is required' if options[:store_name].nil?
    raise ArgumentError, 'api_key is required' if options[:api_key].nil?
    raise ArgumentError, 'password is required' if options[:password].nil?

    @store_name = options[:store_name]
    @api_key = options[:api_key]
    @password = options[:password]

    @store_url = "https://#{@api_key}:#{@password}@#{@store_name}.myshopify.com/admin/"

    @connection = Faraday.new(url: @store_url)
  end

  def get(target, params = {})
    call(:get, target, params)
  end

  def post(target, params = {})
    call(:post, target, params)
  end

  def put(target, params = {})
    call(:put, target, params)
  end

  def delete(target, params = {})
    call(:delete, target, params)
  end

private
  def call(verb, target, params)
    target += '.json' unless target =~ /\.json$/
    resp = @connection.send(verb, target, params)
    return resp.status, JSON.parse(resp.body), resp
  end
end
