defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/\p{Lu}/u, " \\0")
    |> String.replace(~r/\p{P}/u, " ")
    |> String.split
    |> Enum.map(fn x -> String.first(x) end)
    |> Enum.join("")
    |> String.upcase
  end
end
