require 'spec_helper'
require 'rps'

RSpec.describe RPS do
  describe ".play" do
    context "when computer choses a winning weapon" do
      let(:weapon_player) {:rock}
      let(:weapon_computer) { ->() {:paper}  }
      it "compares the selected weapons and returns the winner" do
        expect(RPS.play(weapon_computer, weapon_player)).to eq false
      end
    end
    context "when computer choses a losing weapon" do 
      let(:weapon_player) {:rock}
      let(:weapon_computer) { ->() {:scissors}  }
      it "compares the selected weapons and returns the winner" do
        expect(RPS.play(weapon_computer, weapon_player)).to eq true
      end
    end
  end
end
