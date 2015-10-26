require 'accepton/api/utils'

module AcceptOn
  module API
    module Subscribing
      include AcceptOn::API::Utils

      # Cancels a subscription on AcceptOn
      #
      # @api public
      #
      # @param id [String] The subscription identifier
      #
      # @raises [AcceptOn::Error]
      # @return [AcceptOn::Subscription]
      def cancel_subscription(id)
        perform_post_with_object("/v1/subscriptions/#{id}/cancel", {}, AcceptOn::Subscription)
      end
    end
  end
end