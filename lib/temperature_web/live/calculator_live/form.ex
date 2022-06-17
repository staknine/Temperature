defmodule TemperatureWeb.CalculatorLive.Form do
  use TemperatureWeb, :live_component

  def handle_event("change", %{"temperature" => temperature_params}, socket) do
    temperature = %{value: temperature_params["value"], scale: socket.assigns.scale}

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
        <%= number_input f, :value, value: try_convert(@temperature, @scale) %> 
    </.form>
    </fieldset>
    """
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

  def convert(fahrenheit, :celsius) do
    (fahrenheit - 32) * 5 / 9
  end

  def convert(celsius, :fahrenheit) do
    celsius * 9 / 5 + 32
  end
end
