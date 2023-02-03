defmodule EctoVsStruct.Struct.TaxDetail do
  import Decimal, only: [is_decimal: 1]
  @fields [:type, :rate, :amount]
  @enforce_keys @fields
  defstruct @fields

  def new(type, rate, amount)
      when is_binary(type) and is_decimal(rate) and
             is_struct(amount, EctoVsStruct.Struct.Currency) do
    %__MODULE__{
      type: type,
      rate: rate,
      amount: amount
    }
  end

  def new(%{type: type, rate: rate, amount: amount}),
    do: new(type, rate, EctoVsStruct.Struct.Currency.new(amount))
end
