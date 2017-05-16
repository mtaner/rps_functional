require 'spec_helper'
require 'rps'

RSpec.describe RPS do
  describe ".play" do
    let(:weapon_player) {:rock}
    let(:weapon_computer) {:paper}
    it "compares the selected weapons and returns the winner" do
      expect(RPS.play(:weapon)).to eq false
    end
  end
end
