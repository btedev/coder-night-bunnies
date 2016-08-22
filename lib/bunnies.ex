# Solution using table method of calculating
# least common multiples.
# https://en.wikipedia.org/wiki/Least_common_multiple
defmodule Bunnies do

  def meet(bunnies) do
    primes = Primes.next([])
    meet(bunnies, [], primes)
  end

  def meet(bunnies, factors, primes=[ph|_pt]) do
    if divides_evenly?(bunnies, ph) do
      new_factors = [ph|factors]
      new_bunnies = Enum.map(bunnies, fn(x) -> divide_if_even(x, ph) end)

      case Enum.all?(new_bunnies, fn(x) -> x == 1 end) do
        true ->
          Enum.reduce(new_factors, fn(x, acc) -> x * acc end)
        false ->
          meet(new_bunnies, new_factors, primes)
      end
    else
      # Obtain the next prime
      new_primes = Primes.next(primes)
      meet(bunnies, factors, new_primes)
    end
  end

  def divides_evenly?(list, y) do
    Enum.any?(list, fn(x) -> rem(x, y) == 0 end)
  end

  def divide_if_even(x, y) do
    case rem(x, y) == 0 do
      true ->
        div(x, y) # integer division because x/y is float
      false ->
        x
    end
  end
end

