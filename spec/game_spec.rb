require_relative '../lib/game.rb'
require_relative './spec_helper.rb'
require 'rspec'

describe Game do
  let(:game) { Game.new }

	it "starts score at zero for a new game" do
		expect(game.score).to eq([])
	end

	it "starts with no players when starting a new game" do
		expect(game.players).to eq([])
	end

  it "can add players to the game" do
    game = Game.new
    game.add_player("Bob")
    expect(game.players).to eq(["Bob"])
  end

  it "first player plays on first turn" do
    game.increase_turn
    expect(game.turn).to eq(1)
  end

  it "every player has his own color" do
    game.add_player("Alex")
    game.add_player("Bob")
    expect(game.color(game.players[0])).to eq("black")
    expect(game.color(game.players[1])).to eq("white")
  end
end