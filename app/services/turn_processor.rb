class TurnProcessor
  attr_reader :status, :messages

  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
    @status = 200
    @board = find_opponent_board
  end

  def find_opponent_board
    if @game[:current_turn] == "player_1"
      @game[:player_2_board]
    elsif @game[:current_turn] == "player_2"
      @game[:player_1_board]
    end
  end

  def run!
    #valid turn
    begin
      attack_opponent
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
      @status = 400
    end
    self
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def ship_sunk?
    @board.board.flatten.pluck(target).compact[0].contents.is_sunk?
  end

  def attack_opponent
    result = Shooter.fire!(board: @board, target: target)
    @board.hits += 1 if result == "Hit"
    @messages << "Your shot resulted in a #{result}."


    if result == "Hit" && ship_sunk?
      @messages << "Battleship sunk."
      if @board.hits == 5
        @messages << "Game over."
        @game.update_attribute(:winner, winner)
        @game.save!
      end
    end
    toggle_current_turn
    @game.save!
  end

  def winner
    @game[:game_over] = true
    if @game[:current_turn] == 'player_1'
      User.find(@game.player_1_id).email
    elsif @game[:current_turn] == 'player_2'
      User.find(@game.player_2_id).email
    end
  end

  def toggle_current_turn
    if game[:current_turn] == "player_1"
      game.player_1_turns += 1
      game[:current_turn] = "player_2"
    elsif game[:current_turn] == "player_2"
      game.player_2_turns += 1
      game[:current_turn] = "player_1"
    end
  end

  def ai_attack_back
    result = AiSpaceSelector.new(player.board).fire!
    @messages << "The computer's shot resulted in a #{result}."
    game.player_2_turns += 1
  end

  def player
    Player.new(game.player_1_board)
  end

  def opponent
    Player.new(game.player_2_board)
  end


end
