defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence |>
    String.downcase |>
    String.replace("_", " ") |>
    String.replace(~r/[\p{Po}\p{S}]/u, "") |>
    String.split |>
    Enum.sort |>
    Enum.chunk_by(&(&1)) |>
    Enum.map(fn(x) -> {List.first(x), Enum.count(x)} end) |>
    Enum.into(%{})
  end
end
