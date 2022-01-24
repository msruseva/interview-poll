class PollsController < ApplicationController
  def index
    @polls = Poll.order('created_at DESC')
  end

  def show
    @poll = Poll.includes(:questions).find_by_id(params[:id])
    @vote = Vote.new
  end

  def new
    @poll = Poll.new
    @poll.questions.build.answers.build
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to polls_path

      flash[:message] = 'The poll was successfully created.'
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @poll = Poll.find_by_id(params[:id])

    if @poll.destroy
      flash[:success] = 'The poll was successfully deleted.'
    else
      flash[:warning] = 'The poll was NOT successfully deleted!'
    end
    redirect_to polls_path
  end

  private

  def poll_params
    params.require(:poll).permit(:name, questions_attributes: [:id, :title, :_destroy, answers_attributes: [:id, :answer_text, :_destroy, votes_attributes: [:id, :vote]]])
  end
end
