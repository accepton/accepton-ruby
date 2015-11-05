module AcceptOn
  class Subscription < Base
    # @attr_reader active [Boolean] The activity status of the subscription
    # @attr_reader email [String] The email belonging to the subscription
    # @attr_reader id [String] The subscription identifier
    #
    # @api public
    attr_reader :active, :email, :id

    alias_method :active?, :active

    # The time the subscription was last billed
    #
    # @api public
    #
    # @return [Time]
    def last_billed_at
      Time.parse(@last_billed_at).utc unless @last_billed_at.nil?
    end

    # The plan the subscription is connected to
    #
    # @api public
    #
    # @return [AcceptOn::Plan]
    def plan
      AcceptOn::Plan.new(@plan)
    end
  end
end
