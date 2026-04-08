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
      redirect_to leaderboard_path
    else
      render plain: match.errors.full_messages.join(", ")
    end
  end
end
