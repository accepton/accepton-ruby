require 'accepton/api/utils'

module AcceptOn
  module API
    module Tokenization
      include AcceptOn::API::Utils

      # Creates a transaction token on AcceptOn
      #
      # @api public
      #
      # @example Create a transaction token with an amount of $1.00
      #   create_token(amount: 1_00)
      #
      # @example Create a transaction token with a description
      #   create_token(amount: 1_00, description: 'Test')
      #
      # @example Create a transaction token with a description and application fee
      #   create_token(amount: 10_99, description: 'Test', application_fee: 99)
      #
      # @example Create a Paypal-specific token that pays a merchant and charges
      #          them an application fee
      #   create_token(amount: 15_00, description: 'Test', application_fee: 1_50,
      #                merchant_paypal_account: 'merchant@example.com')
      #
      # @param args [Hash] Attributes to set to the transaction token
      # @option args [Integer] :amount The amount in cents of the transaction
      # @option args [Integer] :application_fee The application fee to be passed on to the processor
      # @option args [String]  :currency The currency to charge in (default: usd)
      # @option args [String]  :description A description of the transaction
      # @option args [String]  :merchant_paypal_account The merchant's Paypal
      #                        account when you want to pay a merchant instead of
      #                        yourself. Can be used with an application fee.
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::TransactionToken]
      def create_token(args = {})
        perform_post_with_object('/v1/tokens', args, AcceptOn::TransactionToken)
      end
    end
  end
end
