require "test_helper"

class MatchTest < ActiveSupport::TestCase
  test "winner and loser cannot be same" do
    player = Player.create!(name: "A")

    match = Match.new(winner: player, loser: player)

    assert_not match.valid?
  end

  test "increments wins and losses" do
    p1 = Player.create!(name: "A")
    p2 = Player.create!(name: "B")

    Match.create!(winner: p1, loser: p2)

    assert_equal 1, p1.reload.wins_count
    assert_equal 1, p2.reload.losses_count
  end
end
