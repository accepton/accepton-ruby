require 'accepton/api/utils'

module AcceptOn
  module API
    module Promotion
      include AcceptOn::API::Utils

      # Creates a promo code on AcceptOn
      #
      # @api public
      #
      # @example Create a "20OFF" promo code for $20 off of a purchase
      #   create_promo_code(name: '20OFF',
      #                     promo_type: 'amount',
      #                     value: 20_00)
      #
      # @example Create a "10-percent" promo code for 10% off of a purchase
      #   create_promo_code(name: '10per',
      #                     promo_type: 'percentage',
      #                     value: '10.0')
      #
      # @example Create a "5dollar" promo code that reduces a purchase to $5.00
      #   create_promo_code(name: '5dollar',
      #                     promo_type: 'fixed_price',
      #                     value: 5_00)
      #
      # @param args [Hash]
      # @option args [String] :name The promo code name, as given to customers.
      # @option args [String] :promo_type The type of promo code.
      # @option args [Numeric] :value The promo code amount.
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::PromoCode] The created promo code
      def create_promo_code(args = {})
        perform_post_with_object('/v1/promo_codes', args, AcceptOn::PromoCode)
      end

      # Deletes a promo code on AcceptOn
      #
      # @api public
      #
      # @example Deletes a promo code previously retrieved by the client
      #   client.delete_promo_code(promo_code)
      #
      # @param promo_code [AcceptOn::PromoCode] The promo code to delete.
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::PromoCode] The deleted promo code
      def delete_promo_code(promo_code)
        perform_delete_with_object("/v1/promo_codes/#{promo_code.original_name}",
                                   {},
                                   AcceptOn::PromoCode)
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

      # Updates a promo code on AcceptOn
      #
      # @api public
      #
      # @example Updates a "SUMMERFUN" promo code to $20 off of a purchase
      #   promo_code.promo_type = 'amount'
      #   promo_code.value = 20_00
      #   client.update_promo_code(promo_code)
      #
      # @param promo_code [AcceptOn::PromoCode] The promo code to update.
      #
      # @raise [AcceptOn::Error] If an API error happens
      # @return [AcceptOn::PromoCode] The updated promo code
      def update_promo_code(promo_code)
        perform_put_with_object("/v1/promo_codes/#{promo_code.original_name}",
                                promo_code.as_params,
                                AcceptOn::PromoCode)
      end
    end
  end
end
