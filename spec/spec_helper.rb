require 'minitest/spec'
require 'minitest/autorun'  # arranges for minitest to run (in an exit handler, so it runs last)

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/cassettes'
  c.hook_into :faraday
end

require 'privateer'

require 'turn'

Turn.config do |c|
  # use one of output formats:
  # :outline  - turn's original case/test outline mode [default]
  # :progress - indicates progress with progress bar
  # :dotted   - test/unit's traditional dot-progress mode
  # :pretty   - new pretty reporter
  # :marshal  - dump output as YAML (normal run mode only)
  # :cue      - interactive testing
  c.format  = :outline
  # turn on invoke/execute tracing, enable full backtrace
  c.trace   = true
  # use humanized test names (works only with :outline format)
  c.natural = true
end

if ENV['LIVE_TEST']
  VALID_OPTIONS = {
        store_name: ENV['SHOPIFY_TEST_STORE'],
        api_key: ENV['SHOPIFY_TEST_API_KEY'],
        password: ENV['SHOPIFY_TEST_PASSWORD'],
    }
else
  VALID_OPTIONS = { store_name: 'test', api_key: 'testkey', password: 'secret' }
end
