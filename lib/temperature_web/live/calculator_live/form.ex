defmodule TemperatureWeb.CalculatorLive.Form do
  use TemperatureWeb, :live_component

  def handle_event("change", %{"temperature" => temperature_params}, socket) do
    value = temperature_params["value"]
    send(self(), {:updated_temperature, %{socket.assigns.temperature | value: value}})

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <fieldset>
      <legend>Enter temperature in Celsius:</legend>
      <.form
        let={f} 
        for={:temperature} 
        id="temperature-form" 
        phx-change="change" 
        phx-target={@myself}
      >
        <%= number_input f, :value, value: @temperature.value %> 
    </.form>
    </fieldset>
    """
  end
end
