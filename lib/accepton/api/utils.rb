module AcceptOn
  module API
    module Utils
      private

      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      def perform_post_with_object(path, params, klass)
        perform_request_with_object(:post, path, params, klass)
      end

      # @param request_method [String, Symbol]
      # @param path [String]
      # @param params [Hash]
      def perform_request(request_method, path, params)
        AcceptOn::Request.new(self, request_method, path, with_environment(params)).perform
      end

      # @param request_method [String, Symbol]
      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      def perform_request_with_object(request_method, path, params, klass)
        response = perform_request(request_method, path, params)
        klass.new(response)
      end

      def with_environment(params)
        params.merge(environment: environment)
      end
    end
  end
end
