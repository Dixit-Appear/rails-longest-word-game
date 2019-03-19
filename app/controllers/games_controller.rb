require "uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  # "https://wagon-dictionary.herokuapp.com/:word"

  def score
#    @uri = URI.parse("https://wagon-dictionary.herokuapp.com/:word")
    @word = params[:word]
    @letters = params[:letters].split(" ")
    @isincluded = true
    @word.chars.each do |x|
      @isincluded = false unless @word.chars.count(x) == @letters.count(x)
    end

    if @isincluded
      @answer = "Congratulations! #{@word} is a valid English word"
    else
      @answer = "Sorry but #{@word} can't be built out of #{@letters}"
    end
  end
end
