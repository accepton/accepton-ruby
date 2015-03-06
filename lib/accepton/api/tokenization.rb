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
      # @param args [Hash] Attributes to set to the transaction token
      # @option args [Integer] :amount The amount in cents of the transaction
      # @option args [String] :description A description of the transaction
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::TransactionToken]
      def create_token(args = {})
        perform_post_with_object('/tokens', args, AcceptOn::TransactionToken)
      end
    end
  end
end
