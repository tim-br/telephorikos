defmodule TelephorikosTest do
  use ExUnit.Case
  doctest Telephorikos

  test "greets the world" do
    assert Telephorikos.hello() == :world
  end
end
