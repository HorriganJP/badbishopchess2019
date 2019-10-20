class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(@game)
  end

  def show
<<<<<<< HEAD
    @game = Game.find(params[:id])
    @pieces = @game.pieces.find(params[:id])
=======
    @game = Game.find_by_id(params[:id])
    @pieces = @game.pieces
    @king = current_user.pieces.where(type: 'King').first
>>>>>>> 8798c0ef58681d4603a41e0a6be835592527552f
  end

  def index
    @unmatched_games = Game.where(:state => 'open')
  end

  def update
    @game = Game.find_by_id(params[:id])
    @game.update_attributes(game_params)
  end

  def join
    @game = Game.find_by_id(params[:id])
    redirect_to game_path(@game)
    if current_user.id != @game.white_player_id
      @game.update_attributes(game_params)
       redirect_to game_path(@game)
    else
      flash[:alert] = "Error: You are already a player in this game!!" 
      redirect_to games_path
    end
  end

  def forfeit
    @game = Game.find_by_id(params[:id])
    @game.update_attributes(game_params)
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :user_id, :white_player_id, :black_player_id)
  end
end
