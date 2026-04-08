class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player", counter_cache: :wins_count
  belongs_to :loser, class_name: "Player", counter_cache: :losses_count
  validate :players_cannot_be_same

  private

  def players_cannot_be_same
    if winner == loser
      errors.add(:base, "Winner and loser cannot be the same")
    end
  end
end
