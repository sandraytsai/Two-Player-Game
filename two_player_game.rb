class Player
  attr_reader :name, :life, :points
  def initialize(name, life=3, points=0)
    @name = name
    @life = life
    @points = points
  end
  def question_right
    @points += 1
  end 
  def question_wrong
    @life -= 1
  end
end 


def random_number
  num = Random.new 
  num.rand(1..20)
end

@player1 = Player.new("Player 1")
@player2 = Player.new("Player 2")

def player_status_display
  puts "#{@player1.name}'s points: #{@player1.points}"
  puts "#{@player1.name}'s lives: #{@player1.life}"
  puts "#{@player2.name}'s points: #{@player2.points}"
  puts "#{@player2.name}'s lives: #{@player2.life}"
end 

def generate_question(current_player, other_player)
  rand_num_1 = random_number
  rand_num_2= random_number

  puts "#{current_player.name}: what is #{rand_num_1} + #{rand_num_2}?"
  answer = gets
  if answer.to_i == rand_num_1 + rand_num_2
    puts "Correct!!"
    current_player.question_right
  else 
    puts "Sorry, that is incorrect! :("
    current_player.question_wrong
    player_status_display
  end
end 

def winner 
  if @player1.life > 0
    "#{@player1.name}"
  else
    "#{@player2.name}"
  end 
end 

 def is_alive?(player)
  player.life > 0
end 


def start_game
  puts "Welcome to the game!"
  puts "Player 1's name: "
  @player1 = Player.new("#{gets.chomp}")
  puts "Player 2's name: "
  @player2 = Player.new("#{gets.chomp}")
  puts "#{@player1.name} will go first."
  while is_alive?(@player1) && is_alive?(@player2) do
    generate_question(@player1, @player2)
    generate_question(@player2, @player1)
  end
  puts "End of game. #{winner} wins!"
  player_status_display
end



start_game



