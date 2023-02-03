Benchee.run(
  %{
    "ecto" => fn data ->
      EctoVsStruct.Ecto.TaxBreakdown.changeset(%EctoVsStruct.Ecto.TaxBreakdown{}, data)
      |> Ecto.Changeset.apply_action!(:create)
    end,
    "plain struct" => fn data ->
      EctoVsStruct.Struct.TaxBreakdown.new(data)
    end,
    "struct minimal" => fn data ->
      EctoVsStruct.StructMinimal.TaxBreakdown.new(data)
    end
  },
  warmup: 10,
  time: 10,
  memory_time: 10,
  reduction_time: 10,
  inputs: %{
    "standard" => %{
      tax_details: [
        %{
          type: "cheese",
          rate: Decimal.new("0.10"),
          amount: %{value: 1000, currency: "AUD"}
        },
        %{
          type: "foo",
          rate: Decimal.new("0.11"),
          amount: %{value: 1100, currency: "AUD"}
        }
      ]
    }
  }
)
