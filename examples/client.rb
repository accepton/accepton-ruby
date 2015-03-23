$LOAD_PATH << File.join('..', Dir.pwd, "lib")
require 'bundler/setup'
require "accepton"

API_KEY = 'skey_be064297e7b2db4b6ce5928e8dcad582'

client = AcceptOn::Client.new(api_key: API_KEY, environment: :development)
ret = client.create_token(amount: 1099, application_fee: 99, currency: 'cad', description: 'test charge')
puts ret.inspect
