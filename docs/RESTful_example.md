##RESTful service example

Here we will be creating an example that auto-configures a client running `CheckoutKit` and then verifies the charge received back from the client.

```ruby
require 'accepton'
require 'sinatra'

#Our global user_id to address hash
$user_id_to_address = {
  "xyz": "480 N Florida Ave, Tampa FL",
  "foo": "9923 Cypress Avenue, Tampa FL",
}

#Located under 'My Profile' in your accepton.com dashboard
ACCEPTON_SECRET_KEY = 'skey_xxxxx'

#Create our client
$client = AcceptOn::Client.new(api_key: ACCEPTON_SECRET_KEY, environment: :staging)

#Begin to purchase a t-shirt or hat
##############################################################
get '/begin_tshirt_purchase' do   
 #Generate an inventory item that will define the payment flow ($10.00)
 t_shirt_good = $client.create_dynamic_good(currency: 'usd', amount: 10_00, description: "T-shirt", secret_metadata: {'for': 't-shirt'})

 #Send the client the good's `id`
 return t_shirst_good.id
end

get '/begin_hat_purchase' do   
 #Generate a transaction that will define the payment flow ($3.27)
 hat_good = $client.create_dynamic_good(currency: 'usd', amount: 3_27, description: "hat", secret_metadata: {'for': 'hat'})
 
 #Send the client the good's `id`
 return hat_good.id
end
##############################################################

#Complete any purchase
##############################################################
get '/complete_purchase' do
 #user_id is not part of the DynamicSDK.  It's just an identifier
 #we're using to lookup a fake address (see $user_id_to_address)
 user_id = params[:user_id]
 address = $user_id_to_address[user_id]
 
 #The charge_id is retrieved from the client with the CheckoutSDK
 charge_id = params[:charge_id]
 
 #Retrieve charge information and what the charge was for that was set 
 #by use (So it's trustable)
 charge_info = $client.charge(charge_id)
 secret_metadata = charge_info.secret_metadata
 
 #`metadata` is set my the consumer-client running `CheckoutKit`.  If your
 #dynamic good has custom-fields enabled, the `metadata` will be set by
 #
 #TODO: how can we show the custom-fields -> metadata relations?
 #Because now they're related to the goods themselves.
 
 #We can trust 'charge_is_for' because we generated it ourselves. Even clients
 #are unable to set this field because it requires the private API key
 if charge_is_for == "t-shirt"
   ship("t-shirt", address)
 elsif charge_is_for == "hat"
   ship("hat", address)
 end
 
 return true
end
##############################################################
```

> 🌏 For this example, `currency` is set to `'usd'` which represents united states dollars.  The `amount` for `'usd'` represents `cents`. See our [Currency Table]() for codes and interpretations for other regions.

##Running the example
  1. Save the example to `main.rb`
  2. Replace `ACCEPTON_SECRET_KEY`
  3. Install gems via `gem install sinatra` and `gem install accepton`
  3. Run `ruby main.rb` which will launch WebBrick on port 4567 by default
  4. Goto [http://localhost:4567/begin\_tshirt_purchase](http://localhost:4567/begin_tshirt_purchase)
