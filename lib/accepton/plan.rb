module AcceptOn
  class Plan < Base
    # @attr_reader amount [Integer] The amount of the plan in cents
    # @attr_reader currency [String] The ISO currency code of the refund
    # @attr_reader id [String] The plan identifier
    # @attr_reader name [String] The name of the plan
    # @attr_reader period_unit [String] the billing frequency unit of the plan
    #
    # @api public
    attr_reader :amount, :currency, :id, :name, :period_unit

    # The time the plan was created
    #
    # @api public
    #
    # @return [Time]
    def created_at
      Time.parse(@created_at).utc unless @created_at.nil?
    end
  end
end
