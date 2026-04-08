class Player < ApplicationRecord
  has_many :wins,class_name: "Match",foreign_key: :winner_id
  has_many :losses,class_name: "Match",foreign_key: :loser_id
  validates :name, presence: true, uniqueness: true
  before_destroy :ensure_no_matches

  private

  def ensure_no_matches
    if wins.exists? || losses.exists?
      errors.add(:base, "Player has match history and cannot be deleted")
      throw(:abort)
    end
  end
end