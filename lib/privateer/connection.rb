class Privateer::Connection
  def initialize(options = {})
    raise ArgumentError, 'store_name is required' if options[:store_name].nil?
    raise ArgumentError, 'api_key is required' if options[:api_key].nil?
    raise ArgumentError, 'password is required' if options[:password].nil?
  end
end
