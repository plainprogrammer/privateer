require 'thread'
class Privateer::Types::ProductArray < Array
  def initialize(connection, params = {})
    @connection = connection
    @params = params
    @mutex = Mutex.new

    status, body, response = @connection.get('products', @params)

    raise Privateer::Errors::UnexpectedResponse unless status == 200
    # TODO should populate self with product objects

    self
  end

  def count
    @mutex.synchronize { @count ||= get_count }
  end
  alias_method :size, :count

private
  def get_count
    status, body, response = @connection.get('products/count', @params)
    raise Privateer::Errors::UnexpectedResponse unless status == 200
    body['count'].to_i
  end
end
