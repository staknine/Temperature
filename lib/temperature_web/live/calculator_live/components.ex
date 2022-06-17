defmodule TemperatureWeb.CalculatorLive.Component do
  use Phoenix.Component

  def boiling_verdict(assigns) do
    ~H"""
    <%= if Temperature.would_boil?(@temperature) do %>
      <p>The water would boil.</p>
    <% else %>
      <p>The water would not boil.</p>
    <% end %>
    """
  end
end
