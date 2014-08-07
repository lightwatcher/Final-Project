class QuestionsController < ApplicationController
  before_filter :login_required

  def index
    @questions = Question.where(user_id: session["user_id"])
  end

  def show
    @question = Question.find_by(id: params[:id])
    @user= User.find_by(id: @question.user_id)
  end

  def new
    if session["user_id"] == 1
      render "new"
    else
      redirect_to "/questions"
    end
  end

  def create
    @question = Question.new
    @question.title = params[:title]
    @question.griffendor_answer = params[:griffendor_answer]
    @question.huffelpuff_answer = params[:huffelpuff_answer]
    @question.ravenclaw_answer = params[:ravenclaw_answer]
    @question.slytheryn_answer = params[:slytheryn_answer]
    @question.user_id = session["user_id"]

    if @question.save
      redirect_to "/questions/#{ @question.id }"
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find_by(id: params[:id])
    if @question.user_id == session["user_id"]
      render "edit"
    else
      redirect_to "/questions"
    end
  end

  def update
    @question = Question.find_by(id: params[:id])
    @question.title = params[:title]
    @question.griffendor_answer = params[:griffendor_answer]
    @question.huffelpuff_answer = params[:huffelpuff_answer]
    @question.ravenclaw_answer = params[:ravenclaw_answer]
    @question.slytheryn_answer = params[:slytheryn_answer]
    @question.user_id = session["user_id"]

    if @question.save
      redirect_to "/questions/#{ @question.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy


    redirect_to "/questions"
  end
end
