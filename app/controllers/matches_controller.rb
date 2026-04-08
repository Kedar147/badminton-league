class MatchesController < ApplicationController
  def new
    @players = Player.all
  end

  def create
    match = Match.new(
      winner_id: params[:winner_id],
      loser_id: params[:loser_id]
    )

    if match.save
      redirect_to leaderboard_path, notice: "Match created successfully"
    else
       redirect_to new_match_path, alert: match.errors.full_messages.join(", ")
    end
  end
end
