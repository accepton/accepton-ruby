![AcceptOn DynamicKit Rubyist Edition](./docs/images/banner.png)
[![Gem Version](https://badge.fury.io/rb/iarrogant.svg)](http://badge.fury.io/rb/accepton-ruby)
[![Build Status](https://circleci.com/gh/accepton/accepton-ruby.svg?style=shield&circle-token=76d9d3cf6e881e7a80b22cc68c223725ade7fa31)](https://circleci.com/gh/accepton/accepton-ruby)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/accepton/accepton-ruby/blob/master/LICENSE)
[![Follow AcceptOn](https://img.shields.io/twitter/follow/acceptonhq.svg?style=social)](https://twitter.com/AcceptOnHQ)

# What is this?
The [AcceptOn](https://accepton.com) *DynamicKit* for rubyist.  Used for your backend integration with AcceptOn.

### Features
  - [x] Generate goods dynamically
  - [x] Verify that a charge completed and for the correct amount
  - [x] List and search charges
  - [x] Refund a charge
  - [x] Create, read, and list plans
  - [x] Cancel, retrieve, and list subscriptions
  - [x] CRUD promo-codes


## Setup

#### 1. Install the gem
```sh
>gem install accepton
```
    
#### 2. Initialize the client
```ruby
require 'accepton'

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_xxxxx'

#The environment may be either :production or :staging
client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :staging)
```

#### 3. Pick an example

 - [A RESTful service that auto-configures `CheckoutKit` and verifies the charge](./docs/RESTful_example.md)
 - [Listing charges for a particular date range](./docs/listing_charges.md)
 - [Refunding a charge](./docs/refunding_charge.md)
 - [Create, read, and list plans](./docs/plans.md)
 - [Cancel, retrieve, and list subscriptions](./docs/subscriptions.md)
 - [CRUD promo-codes](./docs/promo.md)

## Contributing
> ♥ This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Versioning
This project adheres to [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html). Any violations of this scheme are considered to be bugs.
