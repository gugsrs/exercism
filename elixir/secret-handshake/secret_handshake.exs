use Bitwise
defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    casesToCheck = [0b1, 0b10, 0b100, 0b1000]
    ops = Enum.map(casesToCheck, &check_case(&1, code))
    |> Enum.filter(& &1)
    if (code &&& 0b10000) == 16 do
       Enum.reverse(ops)
    else
      ops
    end
  end

  def check_case(check, code) do
    cond do
      (code &&& check) == 1 ->
        "wink"
      (code &&& check) == 2 ->
        "double blink"
      (code &&& check) == 4 ->
        "close your eyes"
      (code &&& check) == 8 ->
        "jump"
      true ->
        nil
    end
  end
end
