class TranslateController < ApplicationController

  def spindi2bg
    @input = params[:spinditext]

    if @input
      @text = @input.dup
      @words = @text.gsub(/[^а-яА-Я0-9\-]/," ").split(" ").uniq

      @words.each do |word|
        @record = Word.find_by(spindi: UnicodeUtils.downcase(word))
        if @record
          @record.name ? @bgword = UnicodeUtils.titlecase(@record.bg) : @bgword = @record.bg
          @text.gsub!(/\b#{word}\b/, @bgword)
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
          @record.name ? @spindiword = UnicodeUtils.titlecase(@record.spindi) : @spindiword = @record.spindi
          @text.gsub!(/\b#{word}\b/, @spindiword)
        end
      end

    end

  end

end
