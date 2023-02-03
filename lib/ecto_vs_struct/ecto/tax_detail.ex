defmodule EctoVsStruct.Ecto.TaxDetail do
  use Ecto.Schema
  import Ecto.Changeset

  @attributes ~w(type rate)a

  @primary_key false
  embedded_schema do
    field(:type, :string)
    field(:rate, :decimal)

    embeds_one(:amount, EctoVsStruct.Ecto.Currency)
  end

  def changeset(%__MODULE__{} = detail, %{} = attributes) do
    detail
    |> cast(attributes, @attributes)
    |> cast_embed(:amount, required: true)
    |> validate_required(@attributes)
  end
end
