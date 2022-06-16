defmodule TemperatureWeb.CalculatorLive do
  use Phoenix.LiveView, layout: {TemperatureWeb.LayoutView, "live.html"}

  alias __MODULE__.Component

  def render(assigns) do
    ~H"""
    <section class="row">
      <Component.boiling_verdict celsius={100} /> 
    </section>
    """
  end
end
