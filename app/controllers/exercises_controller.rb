class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save
      current_user.exercises << @exercise
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update_attributes(params[:exercise])
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
  end

  def index
    @exercises = current_user.exercises
    @exercise = Exercise.new
  end

end
