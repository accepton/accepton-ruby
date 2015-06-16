module AcceptOn
  class Base
    # Creates a object representation of a model
    #
    # @api public
    #
    # @param args [Hash]
    # @return [AcceptOn::Base]
    def initialize(args = {})
      args.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end
  end
end
