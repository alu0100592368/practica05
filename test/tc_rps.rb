require "test/unit"
require "rack/test"
require "./lib/rps.rb"

class RPSTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      run RockPaperScissors::App.new        
  end.to_app
end

