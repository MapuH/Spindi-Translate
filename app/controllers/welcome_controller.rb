class WelcomeController < ApplicationController
  def index
  	@wordcount = Word.count
  end
end
