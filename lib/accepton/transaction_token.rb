module AcceptOn
  class TransactionToken < Base
    # @attr_reader amount [Integer] The amount of the transaction in cents
    # @attr_reader application_fee [Integer] The amount of application fee
    # @attr_reader created [DateTime] The time the transaction was created
    # @attr_reader description [String] A description of the transaction
    # @attr_reader id [String] The transaction identifier
    # @attr_reader merchant_paypal_account [String] The merchant's Paypal
    #              account when you want to pay a merchant instead of
    #              yourself. Can be used with an application fee.
    # @api public
    attr_reader :amount, :application_fee, :created, :description, :id,
                :merchant_paypal_account
  end
end
