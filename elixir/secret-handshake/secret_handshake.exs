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
    casesToCheck = [1, 10, 100, 1000]
    Enum.map(casesToCheck, &check_case(&1))
    check_case(code)
  end

  def check_case(code) do
    cond do
      (code &&& 1) == 1 ->
        "wink"
      (code &&& 10) == 2 ->
        "double wink"
      (code &&& 100) == 4 ->
        "close your eyes"
      (code &&& 1000) == 6 ->
        "jump"
      true ->
        nil
    end
  end
end
