defmodule EctoVsStruct.Struct.Currency do
  @fields [:value, :currency]
  @enforce_keys @fields
  defstruct @fields

  def new(value, currency) when is_integer(value) and is_binary(currency),
    do: %__MODULE__{value: value, currency: String.upcase(currency)}

  def new(%{value: value, currency: currency}), do: new(value, currency)
end
