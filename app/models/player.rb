class Player < ApplicationRecord
  has_many :wins, class_name: "Match",foreign_key: :winner_id,inverse_of: :winner,dependent: :restrict_with_error
  has_many :losses,class_name: "Match",foreign_key: :loser_id,inverse_of: :loser, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true
end