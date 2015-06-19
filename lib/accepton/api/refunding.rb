require 'accepton/api/utils'

module AcceptOn
  module API
    module Refunding
      include AcceptOn::API::Utils

      # Refunds a charge by the specified amount
      #
      # @api public
      #
      # @example Create a refund of $1.00 on charge chg_47ce6dacb1ec5124
      #   refund(amount: 1_00, charge_id: 'chg_47ce6dacb1ec5124')
      #
      # @param args [Hash] Attributes to set on the refund
      # @option args [Integer] :amount The amount in cents to refund
      # @option args [String] :charge_id The id of the charge to refund
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::Refund]
      def refund(args = {})
        perform_post_with_object('/v1/refunds', args, AcceptOn::Refund)
      end
    end
  end
end
