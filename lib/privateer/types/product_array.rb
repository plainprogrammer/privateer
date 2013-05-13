class Privateer::Types::ProductArray < Array
  def initialize(connection, params = {})
    @connection = connection
    @params = params

    status, body, response = @connection.get('products', @params)

    # TODO should raise an error unless status is 200
    # TODO should populate self with product objects
    self
  end

  def size
    status, body, response = @connection.get('products/count', @params)

    # TODO should raise an error unless status is 200
    body['count'].to_i
  end
end
