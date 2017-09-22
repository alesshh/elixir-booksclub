defmodule App.Hello do
  @prefix Application.get_env(:app, __MODULE__)[:prefix]

  def say(str) do
    @prefix <> str
  end
end
