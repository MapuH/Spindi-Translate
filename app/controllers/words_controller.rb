class WordsController < ApplicationController

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)

    if @word.valid? && verify_recaptcha(model: @word, message: "reCAPTCHA Error!")
      @word.save
      redirect_to addword_path, flash: { success: "Думата \"#{@word.spindi}\" беше успешно добавена!" }
    else
      flash.delete(:recaptcha_error)
      render 'new'
    end
  end

  private
  def word_params
    params.require(:word).permit(:spindi, :bg)
  end
  
end
