require "test/unit"
require "rack/test"
require "./lib/rps"

class RPSTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      run RockPaperScissors::App.new
    end.to_app
  end
   
  def test_index
    get "/"
    assert last_response.ok?
  end

  def test_body
    get "/"
    assert last_response.body.include? ("Bienvenido a Piedra Papel y Tijera")
  end
  
  def test_title
    get "/"
    assert_match "<title>Piedra-Papel-Tijera App</title>", last_response.body
  end

  
end