defmodule TemperatureWeb.CalculatorLive do
  use Phoenix.LiveView, layout: {TemperatureWeb.LayoutView, "live.html"}
  use Phoenix.HTML

  alias __MODULE__.Component
  alias __MODULE__.Form

  def mount(_params, _session, socket) do
    {:ok, assign(socket, temperature: %Temperature{value: "0", scale: :celsius})}
  end

  def handle_info({:updated_temperature, temperature}, socket) do
    {:noreply, assign(socket, :temperature, temperature)}
  end

  def render(assigns) do
    ~H"""
    <div> 
      <.live_component module={TemperatureWeb.CalculatorLive.Form}
        id="celsius-form" 
        temperature={@temperature}  
        scale={:celsius}/>

      <.live_component module={TemperatureWeb.CalculatorLive.Form}
        id="fahrenheit-form" 
        temperature={@temperature}  
        scale={:fahrenheit}/>

      <Component.boiling_verdict temperature={@temperature} /> 
    </div>
    """
  end
end
