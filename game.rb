require 'rspec'
require 'awesome_print'

class RPS
  attr_writer :rand_seed

  def initialize(guess:)
    @guess = guess.downcase
  end

  def randomization_algorithm
    rand 2342343
  end

  def computer_guess
    srand (@rand_seed) || randomization_algorithm
    computer_guess = %w(rock paper scissors)
    computer_guess.sample
  end

  def winner_is
    if rule_engine[computer_guess.to_sym].include? @guess
      'Computer wins'
    elsif rule_engine[@guess.to_sym].include? computer_guess
      'You win!'
    else
      'Tie'
    end
  end

  def rule_engine
    {
      'rock':     ['scissors'],
      'paper':    ['rock'],
      'scissors': ['paper']
    }
  end
end

# ap rps = RPS.new(guess: 'Rock')
# ap rps.winner_is

describe RPS do

  it 'paper beats rock' do
    rps = RPS.new(guess: 'rock')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('Computer wins')
  end

  it 'paper loses to scissors' do
    rps = RPS.new(guess: 'Scissors')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('You win!')
  end

  it 'paper ties with paper' do
    rps = RPS.new(guess: 'paper')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('Tie')
  end
end