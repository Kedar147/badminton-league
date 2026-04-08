require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  test "should not save player without name" do
    player = Player.new
    assert_not player.save
  end

  test "should not allow duplicate names" do
    Player.create!(name: "Kedar")
    duplicate = Player.new(name: "Kedar")

    assert_not duplicate.valid?
  end
end
