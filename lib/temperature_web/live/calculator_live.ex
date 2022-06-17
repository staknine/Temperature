defmodule TemperatureWeb.CalculatorLive do
  use Phoenix.LiveView, layout: {TemperatureWeb.LayoutView, "live.html"}
  use Phoenix.HTML

  alias __MODULE__.Component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, temperature: %{value: "0"})}
  end

  def handle_event("change", %{"temperature" => temperature_params}, socket) do
    temperature = %{value: temperature_params["value"]}

    {:noreply, assign(socket, :temperature, temperature)}
  end

  def render(assigns) do
    ~H"""
    <div> 
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
      <Component.boiling_verdict temperature={@temperature} /> 
    </div>
    """
  end
end
