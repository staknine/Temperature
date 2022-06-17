defmodule TemperatureWeb.CalculatorLive.Form do
  use TemperatureWeb, :live_component

  def render(assigns) do
    ~H"""
    <fieldset>
      <legend>Enter temperature in Celsius:</legend>
      <.form
        let={f} 
        for={:temperature} 
        id="temperature-form" 
        phx-change="change" 
      >
        <%= number_input f, :value, value: @temperature.value %> 
    </.form>
    </fieldset>
    """
  end
end
