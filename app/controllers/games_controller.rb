require "json"
require "open-uri"

class GamesController < ApplicationController
  def index
  end

  def new
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
    @score = 0
    @letters = params[:letters]
    @word = params[:word].upcase
    url = "https://dictionary.lewagon.com/#{@word}"
    word_serialized = URI.open(url).read
    valid_word = JSON.parse(word_serialized)['found']


    if @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter)} && valid_word
      @result = 'Mon mot existe'
    else
      @result = 'mot ou lettres invalides'
    end
  end
end
