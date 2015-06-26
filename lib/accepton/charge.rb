module AcceptOn
  class Charge < Base
    # @attr_reader amount [Integer] The amount charged in cents
    # @attr_reader application_fee [Integer] The application fee by the
    #              application owner in cents
    # @attr_reader currency [String] The ISO code of the currency charged
    # @attr_reader description [String] The description of the charge
    # @attr_reader id [String] The charge identifier
    # @attr_reader metadata [Hash] Any metadata about the charge
    # @attr_reader refunded [Boolean] Whether the charge has been refunded
    # @attr_reader remoted_id [String] The charge identifier on the processor
    # @attr_reader status [String] The status of the charge
    attr_reader :amount, :application_fee, :currency, :description,
                :id, :metadata, :refunded, :remote_id, :status

    # The time the charge was created
    #
    # @api public
    #
    # @return [Time]
    def created_at
      Time.parse(@created_at).utc unless @created_at.nil?
    end
  end
end
