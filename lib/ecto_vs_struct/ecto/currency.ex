defmodule EctoVsStruct.Ecto.Currency do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:value, :integer)
    field(:currency, :string, default: "AUD")
  end

  def changeset(currency, params) do
    currency
    |> cast(params, [:value, :currency])
    |> validate_required([:value, :currency])
    |> uppercase_currency()
  end

  defp uppercase_currency(changeset) do
    currency =
      changeset
      |> get_field(:currency)
      |> String.upcase()

    put_change(changeset, :currency, currency)
  end
end
