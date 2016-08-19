defmodule PrimesTest do
  use ExUnit.Case
  doctest Primes

  import Primes

  test "list of possible primes when max = 2" do
    assert poss_primes(2) == [2]
  end

  test "list of possible primes when max = 3" do
    assert poss_primes(3) == [2,3]
  end

  test "list of possible primes when max = 5" do
    assert poss_primes(5) == [2,3,5]
  end

  test "list of possible primes when max = 12" do
    assert poss_primes(12) == [2,3,5,7,9,11]
  end

  test "list of primes up to 2" do
    assert upto(2) == [2]
  end

  test "list of primes up to 3" do
    assert upto(3) == [2,3]
  end

  test "list of primes up to 12" do
    assert upto(12) == [2,3,5,7,11]
  end

  test "list of primes up to 30" do
    assert upto(30) == [2,3,5,7,11,13,17,19,23,29]
  end
end

