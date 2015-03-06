require 'accepton/api/utils'

module AcceptOn
  module API
    module Tokenization
      include AcceptOn::API::Utils

      def create_token(args = {})
        perform_post_with_object('/tokens', args, AcceptOn::TransactionToken)
      end
    end
  end
end
