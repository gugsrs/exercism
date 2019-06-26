defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    splitted_sentence = String.downcase(sentence)
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
    Enum.uniq(splitted_sentence)
    |> Enum.map(fn k -> {k, Enum.count(splitted_sentence, fn x -> x == k end)} end)
    |> Enum.into(%{})
  end
end
