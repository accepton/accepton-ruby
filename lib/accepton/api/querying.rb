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
    end
  end
end
