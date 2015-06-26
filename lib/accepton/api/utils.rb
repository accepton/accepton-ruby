require 'accepton/request'

module AcceptOn
  module API
    module Utils
      private

      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      #
      # @return [klass]
      def perform_get_with_object(path, params, klass)
        perform_request_with_object(:get, path, params, klass)
      end

      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      #
      # @return [Array<klass>]
      def perform_get_with_objects(path, params, klass)
        perform_request_with_objects(:get, path, params, klass)
      end

      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      #
      # @return [klass]
      def perform_post_with_object(path, params, klass)
        perform_request_with_object(:post, path, params, klass)
      end

      # @param request_method [String, Symbol]
      # @param path [String]
      # @param params [Hash]
      #
      # @return [AcceptOn::Request]
      def perform_request(request_method, path, params)
        AcceptOn::Request.new(self, request_method, path, with_environment(params)).perform
      end

      # @param request_method [String, Symbol]
      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      #
      # @return [klass]
      def perform_request_with_object(request_method, path, params, klass)
        response = perform_request(request_method, path, params)
        klass.new(response)
      end

      # @param request_method [String, Symbol]
      # @param path [String]
      # @param params [Hash]
      # @param klass [Class]
      #
      # @returns [Array<klass>]
      def perform_request_with_objects(request_method, path, params, klass)
        perform_request(request_method, path, params)[:data].map do |element|
          klass.new(element)
        end
      end

      # @param params [Hash]
      #
      # @return [Hash]
      def with_environment(params = {})
        params.merge(environment: environment)
      end
    end
  end
end
