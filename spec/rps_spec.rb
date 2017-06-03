require 'spec_helper'
require 'rps'

RSpec.describe RPS do
  describe ".compare_weapons" do
    it "returns -1 when weapon_1 wins" do
      player_weapon = "scissors"
      cpu_weapon = "rock"
      expect(RPS.compare_weapons(cpu_weapon, player_weapon)).to eq(-1)
    end

    it "returns 0 when there is a draw" do
      player_weapon = "scissors"
      cpu_weapon = "scissors"
      expect(RPS.compare_weapons(cpu_weapon, player_weapon)).to eq(0)
    end

    it "returns 1 when weapon_2 wins" do
      player_weapon = "scissors"
      cpu_weapon = "paper"
      expect(RPS.compare_weapons(cpu_weapon, player_weapon)).to eq(1)
    end

    it "returns 1 when weapon_2 wins" do
      player_weapon = "paper"
      cpu_weapon = "rock"
      expect(RPS.compare_weapons(cpu_weapon, player_weapon)).to eq(1)
    end

    it "returns -1 when weapon_2 wins" do
      player_weapon = "rock"
      cpu_weapon = "paper"
      expect(RPS.compare_weapons(cpu_weapon, player_weapon)).to eq(-1)
    end
  end

  describe ".weapon_chooser" do
    it "randomly chooses only rock, paper and scissors" do
      counts = 9_000
      .times
      .map { RPS.weapon_chooser }
      .reduce([0, 0, 0]) do |(rock_count, paper_count, scissor_count), weapon|
        case weapon
        when "rock"
          [rock_count + 1, paper_count, scissor_count]
        when "paper"
          [rock_count, paper_count + 1, scissor_count]
        when "scissors"
          [rock_count, paper_count, scissor_count + 1]
        end
      end

      counts.each do |count|
        expect(count).to be_within(100).of(3000)
      end
    end
  end
end
