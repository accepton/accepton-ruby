require 'accepton/api/utils'

module AcceptOn
  module API
    module Planning
      include AcceptOn::API::Utils

      # Creates a plan on AcceptOn
      #
      # @api public
      #
      # @example Create a plan named "Test plan"
      #   create_plan(name: 'Test Plan',
      #               currency: 'usd',
      #               amount: 20_00,
      #               period_unit: 'year')
      #
      # @param args [Hash]
      # @option args [String] :name The plan name.
      # @option args [String] :currency The currency to be used, in ISO 4217 format.
      # @option args [Numeric] :amount The plan amount.
      # @option args [String] :period_unit The billing frequency unit, (in month or year only).
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::Plan] The created plan
      def create_plan(args = {})
        perform_post_with_object('/v1/plans', args, AcceptOn::Plan)
      end
    end
  end
end
