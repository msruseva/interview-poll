class VotesController < ApplicationController
  def create
    if current_user && params[:poll] && params[:poll][:id] && params[:question] && params[:question][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @question = @poll.questions.find_by_id(params[:question][:id])

      if @question && @poll && !current_user.voted_for?(@poll)
        current_user.votes.create({user: current_user, question: @question})

        render js: 'alert(\'You have successfully voted!\');'
      else
        render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
      end
    else
      render js: 'alert(\'Your vote cannot be saved.\');'
    end
  end
end
