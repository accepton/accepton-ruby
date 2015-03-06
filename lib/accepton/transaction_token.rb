module AcceptOn
  class TransactionToken
    attr_reader :amount, :created, :description, :id

    def initialize(args = {})
      args.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end
  end
end
