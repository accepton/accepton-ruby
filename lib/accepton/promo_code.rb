require 'accepton/base'

module AcceptOn
  class PromoCode < Base
    # @attr_reader created_at [DateTime] The time the promo code was created.
    # @attr_reader original_name [String] The original promo code name, if the
    #                                     name was modified.
    # @api public
    attr_reader :created_at, :original_name

    # @attr_accessor name [String] The promo code as given to a customer
    # @attr_accessor promo_type [String] The type of promo code. One of:
    #                                    "amount", "fixed_price", or
    #                                    "percentage".
    # @attr_accessor value [Numeric] The amount of discount to apply, based on
    #                                the type. If promo_type is "amount" or
    #                                "fixed_price", an integer amount in
    #                                cents. If type is "percentage", a decimal
    #                                percentage.
    # @api public
    attr_accessor :name, :promo_type, :value

    # Creates a hash representation of the promo code's current values
    #
    # @return [Hash] A hash representing the promo code.
    def as_params
      {name: name, promo_type: promo_type, value: value}
    end

    # Sets the new name of the promo code and memorizes the original
    #
    # @api public
    #
    # @param name [String] The new name to set for the promo code.
    def name=(name)
      @original_name ||= @name
      @name = name
    end

    # Gets the original name of the promo code
    #
    # @api public
    #
    # @return [String] The original name for the promo code.
    def original_name
      @original_name || @name
    end
  end
end
