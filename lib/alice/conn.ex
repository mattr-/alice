defmodule Alice.Conn do
  defstruct([:message, :slack, :state])

  def make(message, slack, state \\ []) do
    make({message, slack, state})
  end
  def make({message, slack, state}) do
    %__MODULE__{message: message, slack: slack, state: state}
  end

  def command?(conn = %Alice.Conn{}) do
    String.contains?(conn.message.text, "<@#{conn.slack.me.id}>")
  end

  def user(conn = %Alice.Conn{}) do
    conn.slack.users[conn.message.user].name
  end
end
