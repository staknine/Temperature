defmodule TemperatureWeb.CalculatorLive.Form do
  use TemperatureWeb, :live_component

  def handle_event("change", %{"temperature" => temperature_params}, socket) do
    temperature = %Temperature{value: temperature_params["value"], scale: socket.assigns.scale}

    send(self(), {:updated_temperature, temperature})
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <fieldset>
      <legend>Enter temperature in <%= @scale %>:</legend>
      <.form
        let={f} 
        for={:temperature} 
        phx-change="change" 
        phx-target={@myself}
      >
        <%= number_input f, :value, value: Temperature.try_convert(@temperature, @scale) %> 
    </.form>
    </fieldset>
    """
  end
end
