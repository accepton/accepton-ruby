#Refunding a charge
Here we will refund a previous charge

```rb
require 'accepton'

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_xxxxx'

#Create our client
$client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :staging)

#Charge id (chg_xxxxx) should be passed in through command line argument0
charge_id = ARGV[0]

#Refund some amount, multiple partial refunds are allowed up-to the original charge.
$client.refund(currency: 'usd', amount: 10_00, charge_id: charge_id)
```

> 🌏 For this example, `currency` is set to `'usd'` which represents united states dollars.  The `amount` for `'usd'` represents `cents`. See our [Currency Table]() for codes and interpretations for other regions.

##Running the example
  1. Save the example to `main.rb`
  2. Replace `ACCEPTON_SECRET_KEY`
  3. Run `ruby main.rb chg_xxxxx` where `chg_xxxxx` is a real charge identifier.  **This can be expensive in production, so tread with caution**
