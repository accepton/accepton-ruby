#Cancel, retrieve, and list subscriptions
Here we will show how to cancel, retrieve, and list subscriptions. Subscriptions
are instances of a plan.

```rb
require 'accepton'

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_xxxxx'

#Create our client
$client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :staging)

#Cancel a subscription by id
$client.cancel_subscription('sub_123')

def subscription_to_s subscription
  plan = subscription.plan
  plan_str = "#{plan.name} - #{plan.amount}#{plan.currency} every #{plan.period_unit}"

  "#{subscription.active ? '[active]' : '[inactive]'} - #{plan_str}"
end

#Retrieve a subscription
retrieved_subscription = client.subscription('sub_123')

#List subscriptions, paged response
subscriptions = client.subscriptions(page: 1, per_page: 20, active: true)

puts "Retrieved subscription - #{subscription_to_s retrieved_subscription}"
subscriptions.each do |subscription|
  puts subscription_to_s subscription
end
```

> 🌏 For this example, `currency` is set to `'usd'` which represents united states dollars.  The `amount` for `'usd'` represents `cents`. See our [Currency Table]() for codes and interpretations for other regions.

##Running the example
  1. Save the example to `main.rb`
  2. Replace `ACCEPTON_SECRET_KEY`
  3. Run `ruby main.rb`
