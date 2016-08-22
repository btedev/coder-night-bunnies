defmodule BunniesTest do
  use ExUnit.Case
  doctest Bunnies

  import Bunnies

  test "determines if any elements in a list divide evenly" do
    bunnies = [4,7,12,21,42]
    assert divides_evenly?(bunnies, 2) == true
    assert divides_evenly?(bunnies, 3) == true
    assert divides_evenly?(bunnies, 17) == false
  end

  test "meeting point for [2,3] should be 6" do
    bunnies = [2,3]
    assert meet(bunnies) == 6
  end

  test "meeting point for [4,7,12,21,42] should be 84" do
    bunnies = [4,7,12,21,42]
    assert meet(bunnies) == 84
  end
end

