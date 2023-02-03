defmodule EctoVsStruct.Ecto.TaxBreakdown do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_many(:tax_details, EctoVsStruct.Ecto.TaxDetail)
  end

  def changeset(%__MODULE__{} = tax_breakdown, %{} = attributes) do
    tax_breakdown
    |> cast(attributes, [])
    |> cast_embed(:tax_details)
  end
end
