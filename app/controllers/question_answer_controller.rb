class QuestionAnswerController < ApplicationController
  def create
    unless params[:answer] == "I7O6"
      render "home/new"
    else
      @question2 = true
      redirect_to home_new_path
    end
  end
end
