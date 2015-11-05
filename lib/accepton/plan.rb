module AcceptOn
  class Plan < Base
    # @attr_reader name [String] The name of the plan
    # @attr_reader amount [Integer] The amount of the plan in cents
    # @attr_reader created_at [DateTime] The time the plan was created
    # @attr_reader currency [String] The ISO currency code of the refund
    # @attr_reader id [String] The plan identifier
    # @attr_reader period_unit [String] the billing frequency unit of the plan
    #
    # @api public
    attr_reader :name, :amount, :created_at, :currency, :id, :period_unit
  end
end
