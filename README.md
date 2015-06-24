# AcceptOn

Please see http://developers.accepton.com for more information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'accepton'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install accepton

Then, initialize the client like so:

```ruby
require "accepton"

client = AcceptOn::Client.new(api_key: API_KEY, environment: :staging)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write your code *and unit tests*
4. Ensure all tests still pass (`bundle exec rspec`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new pull request
