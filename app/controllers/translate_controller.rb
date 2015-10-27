class TranslateController < ApplicationController

  def spindi2bg
    @input = params[:spinditext]

    if @input
      @text = @input.dup
      @words = @text.gsub(/[^а-яА-Я0-9\-]/," ").split(" ").uniq
      @replace = []

      @words.each do |word|
        if Word.exists?(spindi: UnicodeUtils.downcase(word))
          @replace << word
        end
      end

      @replace.each do |word|
        @record = Word.find_by(spindi: UnicodeUtils.downcase(word))
        @bgword = @record.bg
        @text.gsub!(word, @bgword)
      end

    end

  end

  def bg2spindi
  end

end
