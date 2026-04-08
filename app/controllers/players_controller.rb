class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      @players = Player.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])

    if @player.destroy
      redirect_to players_path, notice: "Player deleted successfully"
    else
      @players = Player.all
       redirect_to players_path, alert: @player.errors.full_messages.join(", ")
    end
  end

  def leaderboard
    @players = Player.order(wins_count: :desc)
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end