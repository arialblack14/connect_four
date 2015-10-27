require_relative '../lib/checker.rb'
require_relative '../lib/game.rb'
require_relative '../spec/spec_helper'
require 'rspec'

describe Checker do
  context "checker utility methods:" do
    let(:checker) { Checker.new }
    let(:game) { double(:game, players: ["Alex", "Bob"], turn: 1) }

    it "grid has 7 columns and 6 rows" do      
      expect(checker.columns_num).to eq(7)
      expect(checker.rows_num).to eq(6)
    end

    it "drops at the bottom of the grid" do
      checker.drop_at_column(3, 4, "Alex")
      expect(checker.grid[3][4]).to eq("\u2689".encode('utf-8'))
    end

    xit "can't occupy other checker's position" do
      checker.drop_at_column(1,1, "Alex")

      checker.drop_at_column(1,1, "Bob")
      expect(STDOUT).to receive(:puts).with("Invalid move!")
    end

    it "creates a 7x6 grid" do
      grid = checker.create_grid(1,1)
      expect(grid).to be_a_kind_of(Array)
    end
  end
end