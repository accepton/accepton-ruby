#Create, Read, and List plans
Here we will show how to create, read, and list available plans

```rb
staging 'accepton'

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_xxxxx'

#Create our client
$client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :staging)

#Create a new plan for $10.00 that will be charged monthly
created_plan = $client.create_plan(name: 'Test Plan', amount: 1000, currency: 'usd', period_unit: 'month')

#Retrieve that same plan
retrieved_plan = $client.plan(created_plan.id)

#List all plans
plans = $client.plans

def plan_to_s plan
  "#{plan.name} - #{plan.amount}#{plan.currency} every #{plan.period_unit}"
end

puts "Created plan: #{plan_to_s(created_plan)}"
puts "Retrieved plan: #{plan_to_s(retrieved_plan)}"

puts "Plans listing"
puts "-------------------------------------------"
plans.each do |plan|
  puts plan_to_s plan
end
```

> 🌏 For this example, `currency` is set to `'usd'` which represents united states dollars.  The `amount` for `'usd'` represents `cents`. See our [Currency Table]() for codes and interpretations for other regions.

##Running the example
  1. Save the example to `main.rb`
  2. Replace `ACCEPTON_SECRET_KEY`
  3. Run `ruby main.rb`
