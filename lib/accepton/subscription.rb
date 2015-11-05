module AcceptOn
  class Subscription < Base
    # @attr_reader email [String] The email belonging to the subscription
    # @attr_reader active [Boolean] The activity status of the subscription
    # @attr_reader last_billed_at [DateTime] The time the subscription was last billed
    # @attr_reader plan [Hash] The plan associated with the subscription
    # @attr_reader id [String] The subscription identifier
    #
    # @api public
    attr_reader :email, :active, :last_billed_at, :id, :plan
  end
end
