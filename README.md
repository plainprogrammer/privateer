# Privateer

Privateer provides an interface for integrating private apps with the Shopify API.

[![Build Status](https://travis-ci.org/plainprogrammer/privateer.png?branch=master)](https://travis-ci.org/plainprogrammer/privateer)
[![Code Climate](https://codeclimate.com/github/plainprogrammer/privateer.png)](https://codeclimate.com/github/plainprogrammer/privateer)

## Installation

Add this line to your application's Gemfile:

    gem 'privateer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install privateer

## Normal Usage

    store = Privateer::Connection.new(store_name: 'test', api_key: 'testkey', password: 'secret')

## Advanced Usage

The Shopify API may move faster than this gem gets updated. To cope with that we have four basic methods exposed by
Privateer::Connection to allow you to work around things that are missing in our implementation:

    store.get('products', {})
    store.post('products', {})
    store.put('products', {})
    store.delete('products', {})

Everything in this gem is built on those four core methods, and since we expose them to you it is easy to make up for
anything we happen to miss.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
