# Generate prime numbers by primality test.
# I would have used a more efficient generator like
# the Sieve of Eratosthenes but this challenge
# requires a sequence or primes without a known upper bound.
# The algorithm tests each number (n) starting at the highest prime+1
# by dividing all primes between 2 and the square root of n.
defmodule Primes do

  def next([]) do
    [2]
  end

  def next(list=[h|_t]) do
    next(list, h+1)
  end

  def next(list, n) do
    any = 2..round(:math.sqrt(n))
          |> Enum.any?(fn(x) -> rem(n,x) == 0 end)

    case any do
      true ->
        next(list, n+1)
      false ->
        [n|list]
    end
  end

end

