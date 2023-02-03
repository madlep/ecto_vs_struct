defmodule EctoVsStruct.Struct.TaxBreakdown do
  defstruct tax_details: []

  def new(tax_details) when is_list(tax_details), do: %__MODULE__{tax_details: tax_details}

  def new(%{tax_details: tax_details}) do
    tax_details
    |> Enum.map(&EctoVsStruct.Struct.TaxDetail.new/1)
    |> new()
  end
end
