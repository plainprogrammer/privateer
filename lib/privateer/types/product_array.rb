class Privateer::Types::ProductArray < Array
  include Mutex_m

  def initialize(connection, params = {})
    @connection = connection
    @params = params

    status, body, response = @connection.get('products', @params)

    raise Privateer::Errors::UnexpectedResponse unless status == 200
    # TODO should populate self with product objects

    self
  end

  def count
    synchronize { @count ||= get_count }
  end

private
  def get_count
    status, body, response = @connection.get('products/count', @params)
    raise Privateer::Errors::UnexpectedResponse unless status == 200
    body['count'].to_i
  end
end
