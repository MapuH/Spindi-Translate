class TranslateController < ApplicationController

  def spindi2bg
    @input = params[:spinditext]

    if @input
      @text = @input.dup
      @words = @text.gsub(/[^а-яА-Я0-9\-]/," ").split(" ").uniq

      @words.each do |word|
        @record = Word.find_by(spindi: UnicodeUtils.downcase(word))
        if @record
          @bgword = @record.bg
          @text.gsub!(word, @bgword)
        end
      end

    end
    
  end

  def bg2spindi
    @input = params[:bgtext]

    if @input
      @text = @input.dup
      @words = @text.gsub(/[^а-яА-Я0-9\-]/," ").split(" ").uniq

      @words.each do |word|
        @record = Word.find_by(bg: UnicodeUtils.downcase(word))
        if @record
          @spindiword = @record.spindi
          @text.gsub!(word, @spindiword)
        end
      end

    end

  end

end
