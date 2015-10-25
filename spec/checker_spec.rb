require_relative '../lib/checker.rb'
require_relative '../lib/game.rb'
require_relative '../spec/spec_helper'
require 'rspec'

describe Checker do
  context "checker utility methods" do
    let(:checker) { Checker.new }

    it "grid has 7 columns and 6 rows" do      
      expect(checker.columns_num).to eq(7)
      expect(checker.rows_num).to eq(6)
    end

    it "drops at the bottom of the grid" do
      checker.drop_at_column(1)
      expect(checker.x).to eq(1)
      expect(checker.y).to eq(1)
    end

    xit "can't occupy other checker's position" do
      checker.drop_at_column(1)
      checker2 = Checker.new
      expect(checker2).to be_kind_of(Checker)
      
      checker2.drop_at_column(1)
      expect(checker2.x).not_to eq(1)
      expect(checker2.y).to eq(1)
    end
  end


    let(:game) { double :game }

    it "has 2 types, either black or white" do
      expect(game.color(@players[0])).to eq("black")

      checker2 = Checker.new
      expect(checker.color(@players[1])).to eq("white")
    end
end