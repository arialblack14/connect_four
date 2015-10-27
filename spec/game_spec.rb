require_relative '../lib/game.rb'
require_relative './spec_helper.rb'
require 'rspec'

describe Game do
  let(:game) { Game.new }

	it "starts with score as an empty array" do
		expect(game.score).to eq([])
	end

	it "starts with no players" do
		expect(game.players).to eq([])
	end

  it "can add another player" do
    game.add_player("Alex")
    expect(game.players).to eq(["Alex"])
    game.add_player("Bob")
    expect(game.players).to eq(["Alex", "Bob"])
  end

  it "can add players to the game" do
    game = Game.new
    game.add_player("Bob")
    expect(game.players).to eq(["Bob"])
  end

  it "starts when turn is an odd number" do
    expect(game.turn.odd?).to be true
  end

  it "every player has his own color" do
    game.add_player("Alex")
    game.add_player("Bob")
    expect(game.color(game.players[0])).to eq("black")
    expect(game.color(game.players[1])).to eq("white")
  end

  it "has only 2 players" do
    game.add_player("Alex")
    game.add_player("Bob")
    game.add_player("Charlie")
    expect(game.players).to eq(["Alex", "Bob"])
  end
end