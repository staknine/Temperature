defmodule TemperatureWeb.CalculatorLive.Component do
  use Phoenix.Component

  def boiling_verdict(assigns) do
    ~H"""
    <%= if would_boil?(@temperature) do %>
      <p>The water would boil.</p>
    <% else %>
      <p>The water would not boil.</p>
    <% end %>
    """
  end

  def would_boil?(%{value: ""}), do: false

  def would_boil?(%{scale: :celsius} = temperature) do
    String.to_integer(temperature.value) >= 100
  end

  def would_boil?(%{scale: :fahrenheit} = temperature) do
    String.to_integer(temperature.value) >= 212
  end
end
