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

## Usage

    store = Privateer::Connection.new(store_name: 'test', api_key: 'testkey', password: 'secret')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
