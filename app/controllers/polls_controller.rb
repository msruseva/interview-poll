class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
    @poll.questions.build.answers.build
  end

  def create
    @poll = Poll.new(poll_params)
    debugger
    if @poll.save
      redirect_to polls_path

      flash[:message] = 'The poll was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @poll = Poll.find(params[:id])
    @poll.questions.build.answers.build
  end

  def update
    @poll = Poll.find(params[:id])

    if @poll.update(poll_params)
      redirect_to polls_path

      flash[:message] = 'The poll was successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:name, questions_attributes: [:id, :title, answers_attributes: [:id, :answer_text]])
  end
end
