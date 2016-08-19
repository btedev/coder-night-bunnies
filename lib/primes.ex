defmodule Primes do

  # Use the Sieve of Eratosthenes to
  # calculate a list of prime numbers up to n.
  def upto(n) do
    sieve(poss_primes(n), n, 2)
  end

  def sieve(list, _n, nil) do
    list
  end

  def sieve(list, n, p) do

    # new_list includes all numbers up to p plus any greater than p
    # that are not divisible by p
    new_list = Enum.filter(list, fn(x) -> x <= p || rem(x, p) != 0 end)

    # new_p will be the first item from the new list greater than p
    # or nil
    new_p = Enum.find(new_list, fn(x) -> x > p end)

    # Use shortcut to end the sieve once p^2 > n
    # (note: wish I could use a guard for this but math.pow
    # isn't allowed in a guard)
    case new_p != nil && :math.pow(new_p, 2) > n do
      true ->
        new_list
      false ->
        sieve(new_list, n, new_p)
    end
  end

  # Create an initial list of numbers to evaluate as prime.
  # Includes 2 and all odd numbers up to max.
  def poss_primes(max) do
    2..max
    |> Enum.filter(fn(x) -> x == 2 || rem(x, 2) > 0 end)
  end

end

