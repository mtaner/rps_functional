module RPS
  def self.start(input, output, weapon_chooser = weapon_chooser)
    output.puts "Welcome to RPS"
    player_score = 0
    computer_score = 0
    3.times do
      output.puts "Please choose a weapon: rock, paper or scissors"
      weapon = input.gets.chomp
      output.puts "You chose: #{weapon}"
      cpu_weapon = weapon_chooser.call
      output.puts "Computer chose: #{cpu_weapon}"
      result = compare_weapons(cpu_weapon, weapon)
      if result == -1
        computer_score += 1
      elsif result == 1
        player_score += 1
      end

      if player_score > computer_score
        output.puts "You win. Player #{player_score} : #{computer_score} CPU"
      elsif computer_score > player_score
        output.puts "You lose. Player #{player_score} : #{computer_score} CPU"
      end
    end

    if player_score > computer_score
      output.puts "You are SO good."
    elsif computer_score > player_score
      output.puts "You disgust me."
    end
  end

  def self.compare_weapons(weapon_1, weapon_2)
    return 0 if weapon_1 == weapon_2
    {
      ["scissors", "paper"] => -1,
      ["scissors", "rock"] => 1,
      ["paper", "scissors"] => 1,
      ["paper", "rock"] => -1,
      ["rock", "scissors"] => -1,
      ["rock", "paper"] => 1,
    }.fetch([weapon_1, weapon_2])
  end

  def self.weapon_chooser
    ["rock", "paper", "scissors"].sample
  end
end
