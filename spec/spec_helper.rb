require 'rubygems'
require 'bundler/setup'

require 'simplecov'
SimpleCov.start

require 'minitest/spec'
require 'minitest/autorun'
require 'turn'

require 'privateer'

Turn.config do |c|
  c.format  = :outline
  c.trace   = true
  c.natural = true
end

VALID_OPTIONS = {
  store_name: ENV['SHOPIFY_TEST_STORE'] || 'test',
  api_key: ENV['SHOPIFY_TEST_API_KEY'] || 'test',
  password: ENV['SHOPIFY_TEST_PASSWORD'] || 'test',
}
