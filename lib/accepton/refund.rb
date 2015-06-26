module AcceptOn
  class Refund < Base
    # @attr_reader amount [Integer] The amount of the refund in cents
    # @attr_reader created [DateTime] The time the refund was created
    # @attr_reader currency [String] The ISO currency code of the refund
    # @attr_reader id [String] The refund identifier
    # @attr_reader metadata [Hash] Any metadata associated with the refund
    # @attr_reader reason [String] The reason for the refund
    #
    # @api public
    attr_reader :amount, :created, :currency, :id, :metadata, :reason
  end
end
