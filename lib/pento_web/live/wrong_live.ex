defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}
  # alias PentoWeb.Router.Helpers, as: Routes

  def mount(_params, session, socket) do
    # user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     assign(
       socket,
       answer: Enum.random(1..10),
       score: 0,
       message: "Make a guess:",
       session_id: session["live_socket_id"],
       #  current_user: user,
       time: time()
     )}
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2><%= @message %> <%= @time %> </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n}><%= n %></a>
      <% end %>
      <pre>
        <%= @current_user.email %>
        <%= @session_id %>
      </pre>
    </h2>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    if socket.assigns.answer == String.to_integer(guess) do
      {
        :noreply,
        assign(
          socket,
          message: "Your guess: #{guess}. Right! Answer: #{socket.assigns.answer}.",
          score: socket.assigns.score + 100,
          time: time()
        )
      }
    else
      {
        :noreply,
        assign(
          socket,
          message: "Your guess: #{guess}. Wrong. #{socket.assigns.answer} Guess again.",
          score: socket.assigns.score - 1,
          time: time()
        )
      }
    end
  end

  def time() do
    DateTime.utc_now() |> to_string()
  end
end
