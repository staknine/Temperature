defmodule Temperature do
  defstruct [:value, :scale]

  def would_boil?(%{value: ""}), do: false

  def would_boil?(%{scale: :celsius} = temperature) do
    String.to_integer(temperature.value) >= 100
  end

  def would_boil?(%{scale: :fahrenheit} = temperature) do
    String.to_integer(temperature.value) >= 212
  end

  def try_convert(%{scale: scale, value: value}, scale), do: value

  def try_convert(temperature, to_scale) do
    case Float.parse(temperature.value) do
      :error ->
        ""

      {value, _} ->
        value
        |> convert(to_scale)
        |> Float.round(3)
        |> Float.to_string()
    end
  end

  defp convert(fahrenheit, :celsius) do
    (fahrenheit - 32) * 5 / 9
  end

  defp convert(celsius, :fahrenheit) do
    celsius * 9 / 5 + 32
  end
end
