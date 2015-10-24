class TranslateController < ApplicationController

  def main
    @text = params[:spinditext]

    if @text
      @words = @text.gsub(/[^а-яА-Я0-9\-]/," ").split(" ").uniq
      @replace = []

      @words.each do |word|
        if Word.exists?(spindi: UnicodeUtils.downcase(word))
          @replace << word
        end
      end



    end

  end

end
