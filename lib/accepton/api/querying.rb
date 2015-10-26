require 'accepton/api/utils'

module AcceptOn
  module API
    module Querying
      include AcceptOn::API::Utils

      # Retrieves a charge from the API
      #
      # @api public
      #
      # @param id [String] The charge identifier
      #
      # @raises [AcceptOn::Error]
      # @return [AcceptOn::Charge]
      def charge(id)
        perform_get_with_object("/v1/charges/#{id}", {}, AcceptOn::Charge)
      end

      # Retrieves a page of charges from the API
      #
      # @api public
      #
      # @param args [Hash] A hash of query parameters
      # @option args [DateTime, String] :end_date The latest data/time for
      #         the objects to be created on.
      # @option args [DateTime, String] :start_date The earliest date/time for
      #         the objects to be created on.
      # @option args [String] :order The order to sort by (asc or desc).
      # @option args [String] :order_by The field to order by (e.g. created_at).
      #
      # @raises [AcceptOn::Error]
      # @return [AcceptOn::Charge]
      def charges(args = {})
        perform_get_with_objects('/v1/charges', args, AcceptOn::Charge)
      end

      # Retrieves a plan from the API
      #
      # @api public
      #
      # @param id [String] The plan identifier
      #
      # @raises [AcceptOn::Error]
      # @return [AcceptOn::Plan]
      def plan(id)
        perform_get_with_object("/v1/plans/#{id}", {}, AcceptOn::Plan)
      end

      # Retrieves a list of all plans from the API
      #
      # @api public
      #
      # @raises [AcceptOn::Error]
      # @return [AcceptOn::Plan]
      def plans
        perform_get_with_objects('/v1/plans', {}, AcceptOn::Plan)
      end

      # Retrieves a subscription from AcceptOn
      #
      # @api public
      #
      # @raise [AcceptOn::Error]
      # @return [AcceptOn::Subscription]
      def subscription(id)
        perform_get_with_object("/v1/subscriptions/#{id}", {}, AcceptOn::Subscription)
      end

      # Retrieves a page of subscriptions from AcceptOn
      #
      # @api public
      #
      # @param args [Hash] A hash of query parameters
      # @option args [String] :order The order to sort by (asc or desc).
      # @option args [String] :order_by The field to order by (e.g. created_at).
      # @option args [Integer] :page The page number to retrieve.
      # @option args [Integer] :per_page The size of the page to retrieve (max: 100).
      # @option args [Boolean] :active The activity status of the subscription to filter by.
      # @option args [String] 'plan.token' The plan id of the subscription to filter by.
      #
      # @raise [AcceptOn::Error]
      # @return [AcceptOn::Subscription>]
      def subscriptions(args = {})
        perform_get_with_objects('/v1/subscriptions', args, AcceptOn::Subscription)
      end

      # Retrieves a promo code from AcceptOn
      #
      # @api public
      #
      # @example Retrieves the promo code with the name "20OFF"
      #   client.promo_code('20OFF')
      #
      # @param name [String] The name of the promo code to retrieve.
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::PromoCode] The retrieved promo code
      def promo_code(name)
        perform_get_with_object("/v1/promo_codes/#{name}", {}, AcceptOn::PromoCode)
      end

      # Retrieves a page of promo codes from AcceptOn
      #
      # @api public
      #
      # @example Retrieves the most recently created promo codes on the account
      #   client.promo_codes
      #
      # @param args [Hash] A hash of query parameters
      # @option args [String] :order The order to sort by (asc or desc).
      # @option args [String] :order_by The field to order by (e.g. created_at).
      # @option args [Integer] :page The page number to retrieve.
      # @option args [Integer] :per_page The size of the page to retrieve (max: 100).
      # @option args [String, Symbol] :promo_type The type of promo code to filter by.
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [Array<AcceptOn::PromoCode>] The retrieved promo codes
      def promo_codes(args = {})
        perform_get_with_objects('/v1/promo_codes', args, AcceptOn::PromoCode)
      end

      # Retrieves a transaction token from the API
      #
      # @api public
      #
      # @param id [String] The transaction token identifier
      #
      # @raises [AcceptOn::Error]
      # @return [AcceptOn::TransactionToken]
      def token(id)
        perform_get_with_object("/v1/tokens/#{id}", {}, AcceptOn::TransactionToken)
      end
    end
  end
end
