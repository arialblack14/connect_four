require_relative '../lib/game.rb'
require_relative './spec_helper.rb'
require 'rspec'

describe Game do
	it "starts score at zero for a new game" do
		game = Game.new
		expect(game.score).to eq(0)
	end

	it "starts with no players when starting a new game" do
		game = Game.new
		expect(game.players).to eq([])
	end

  it "can add players to the game" do
    game = Game.new
    game.add_player("Bob")
    expect(game.players).to eq(["Bob"])
  end
end