#CRUD promo-codes
Here we will show how to create, read, update, and delete promo-codes

```rb
require 'accepton'
require 'securerandom'

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_37b7e424a2682ff81ca772ae6fbd3642'

#Create our client
$client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :production)

#Create a new promo-code. There are 3 `promo_type`s
#  promo_type
#    amount - `value` means take a N cents off purchase
#    fixed_price - `value` means new price
#    percentage - `value` is a percentage off, so 0.1 means 10% OFF (cost is 90%).
#Here we are creating a promo-code with $20.00 off
promo_name = SecureRandom.hex
$client.create_promo_code(name: promo_name, promo_type: 'amount', value: 20_00)

#Lookup the code that we just made.  Un-necessary but we're just demonstrating an example
created_promo_code = $client.promo_code(promo_name)

def promo_code_to_s pc
  case pc.promo_type
  when  'amount'
    "#{pc.name} - #{pc.value} cents off"
  when  'percentage'
    "#{pc.name} - #{pc.value}% off"
  when  'fixed_price'
    "#{pc.name} - price is #{pc.value}"
  end
end

#List all 'amount' type promo-code
promo_codes = $client.promo_codes(page: 1, per_page: 20, promo_type: 'amount') 

puts "Created promo code - #{promo_code_to_s created_promo_code}"

puts "Listing promo codes"
puts "-----------------------------------------"
promo_codes.each do |promo_code|
  puts promo_code_to_s promo_code
end
```

##Running the example
  1. Save the example to `main.rb`
  2. Replace `ACCEPTON_SECRET_KEY`
  3. Run `ruby main.rb`
