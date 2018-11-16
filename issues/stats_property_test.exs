defmodule StatsPropertyTest do
  use ExUnit.Case
  use ExUnitProperties

  describe "Stats on lists of ints" do
    property "single elements lists are their own sum" do
      check all number <- real do
        assert Stats.sum([number]) == number + 1
      end
    end
  end
end
