defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.to_char_list
    |> Enum.chunk_by(&(&1))
    |> Enum.map_join(fn(x) -> to_string(Enum.count(x)) <> (String.first(to_string(x))) end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.replace(~r/\p{N}+\p{L}+/, "\\0-")
    |> String.split("-", trim: true)
    |> Enum.map_join(fn(x) -> String.duplicate(String.replace(x, ~r/\p{N}+/, ""), String.to_integer(String.replace(x, ~r/\p{L}+/, ""))) end)
    end
end
