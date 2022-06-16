class QuizzesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_quiz, only: [:show, :edit, :update]
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = current_user.quizzes.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to quizzes_path, notice: 'Quiz created successfully!'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @questions = @quiz.questions
    if @quiz.update(quiz_params)
      redirect_to quizzes_path, notice: 'Quiz updated successfully!'
    else
      render :edit
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: %i[title question_type id _destroy])
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end
end
