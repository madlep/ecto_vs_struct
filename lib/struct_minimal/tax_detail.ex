defmodule EctoVsStruct.StructMinimal.TaxBreakdown do
  defstruct tax_details: []

  def new(%{tax_details: tax_details}) do
    details =
      tax_details
      |> Enum.map(fn %{type: type, rate: rate, amount: %{value: value, currency: currency}} ->
        %EctoVsStruct.StructMinimal.TaxDetail{
          type: type,
          rate: rate,
          amount: %EctoVsStruct.StructMinimal.Currency{value: value, currency: currency}
        }
      end)

    %__MODULE__{tax_details: details}
  end
end
