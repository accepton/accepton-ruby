#Listing charges
Here we will list all charges that have occurred in the last 365 days.

```rb
require 'time'
require 'date'
require 'accepton'

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_xxxxx'

#Create our client
$client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :staging)

#Create a range of 365 days in the past
end_date = Date.today
start_date = (end_date - 365)

#Dates must be in the format YYYY-MM-DD, which Date.to_s does automatically
charges = $client.charges(start_date: start_date.to_s, end_date: end_date.to_s, order_by: 'created_at', order: 'asc')

charges.each do |charge|
  created_at = charge.created_at
  amount = charge.amount
  currency = charge.currency

  #More information
  #metadata = charge.metadata
  #refunded = charge.refunded

  puts "Charge for #{amount} cents on #{created_at}"
end
```

##Running the example
  1. Save the example to `main.rb`
  2. Replace `ACCEPTON_SECRET_KEY`
  3. Run `ruby main.rb`
