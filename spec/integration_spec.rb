require "spec_helper"

require "pry"
require "stringio"
require "rps"

RSpec.describe "I play game" do
	describe "player wins first turn" do
		before do
			player_types("scissors", "scissors", "scissors")
			computer_choses("paper", "paper", "paper")
		end

		it "prompts player to chose a weapon" do
			start_game
			expect(output).to include("Please choose a weapon: rock, paper or scissors")
		end

		it "player chooses a weapon" do
			start_game
			expect(output).to include("You chose: scissors")
		end

		it "notifies the player of the weapon chosen by the computer" do
			start_game
			expect(output).to include("Computer chose: paper")
		end

		it "notifies the player they have won the turn" do
			start_game
			expect(output).to include("You win. Player 1 : 0 CPU")
		end
	end

	describe "player wins three turn in a row" do
		before do
			player_types("scissors", "scissors", "scissors")
			computer_choses("paper", "paper", "paper")
		end

		it "prompts for three weapon selections" do
			start_game

			expect(output.split("\n")).to eq([
				"Welcome to RPS",
				"Please choose a weapon: rock, paper or scissors",
				"You chose: scissors",
				"Computer chose: paper",
				"You win. Player 1 : 0 CPU",
				"Please choose a weapon: rock, paper or scissors",
				"You chose: scissors",
				"Computer chose: paper",
				"You win. Player 2 : 0 CPU",
				"Please choose a weapon: rock, paper or scissors",
				"You chose: scissors",
				"Computer chose: paper",
				"You win. Player 3 : 0 CPU",
				"You are SO good."
			])
		end
	end

	describe "computer wins three turn in a row" do
		before do
			player_types("scissors", "rock", "paper")
			computer_choses("rock", "paper", "scissors")
		end

		it "prompts for three weapon selections" do
			start_game

			expect(output.split("\n")).to match([
				"Welcome to RPS",
				"Please choose a weapon: rock, paper or scissors",
				"You chose: scissors",
				"Computer chose: rock",
				"You lose. Player 0 : 1 CPU",
				"Please choose a weapon: rock, paper or scissors",
				"You chose: rock",
				"Computer chose: paper",
				"You lose. Player 0 : 2 CPU",
				"Please choose a weapon: rock, paper or scissors",
				"You chose: paper",
				"Computer chose: scissors",
				"You lose. Player 0 : 3 CPU",
				"You disgust me."
			])
		end
	end

	let(:input_io) { StringIO.new("") }
	let(:output_io) { StringIO.new("") }
	let(:weapon_chooser) { ->() { cpu_choices.shift } }

	let(:cpu_choices) { [] }

	def start_game
		RPS.start(input_io, output_io, weapon_chooser)
	end

	def player_types(*strings)
		input_io.puts(strings)
		input_io.rewind
	end

	def computer_choses(*choices)
		cpu_choices.concat(choices)
	end

	def output
		output_io.rewind
		output_io.read
	end
end
