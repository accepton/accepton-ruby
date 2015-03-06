module AcceptOn
  class TransactionToken
    # @attr_reader amount [Integer] The amount of the transaction
    # @attr_reader create [DateTime] The time the transaction was created
    # @attr_reader description [String] A description of the transaction
    # @attr_reader id [String] The transaction identifier
    # @api public
    attr_reader :amount, :created, :description, :id

    # Creates a model representation of a transaction token
    #
    # @api public
    # @return [Acception::TransactionToken]
    def initialize(args = {})
      args.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end
  end
end
