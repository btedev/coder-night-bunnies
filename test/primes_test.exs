defmodule PrimesTest do
  use ExUnit.Case
  doctest Primes

  import Primes

  test "list of primes on first iteration is [2]" do
    assert next([]) == [2]
  end

  test "list of primes on next iteration is [3,2]" do
    assert next([2]) == [3,2]
  end

  test "list of primes on next iteration is [5,3,2]" do
    assert next([3,2]) == [5,3,2]
  end

  test "list of first 10 primes" do
    primes = Enum.reduce(1..10, [], fn(_x, acc) -> next(acc) end)
    assert primes == Enum.reverse([2,3,5,7,11,13,17,19,23,29])
  end
end

