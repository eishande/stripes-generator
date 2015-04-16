class PatternsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @pattern = Pattern.new
    @dataset = Dataset.new
  end

  def data
    @data =
    #  Dataset.find(params[:dataset_id]).data
    [
      30, 37, 33, 43, 39, 24, 38, 42, 28, 48,
      57, 13, 40, 39, 21, 45, 51, 30, 24, 32,
      41, 19, 33, 35, 49, 56, 14, 40, 42, 45 ]
    respond_to do |format|
      format.json {
        render :json => @data
      }
    end
  end

  def show
    @data =
    #  Dataset.find(params[:dataset_id]).data
    [
      30, 37, 33, 43, 39, 24, 38, 42, 28, 48,
      57, 13, 40, 39, 21, 45, 51, 30, 24, 32,
      41, 19, 33, 35, 49, 56, 14, 40, 42, 45 ]
    respond_to do |format|
      format.html {
        render :show
      }
      format.json {
        render :json => @data
      }
    end
  end

  def create
    @pattern = current_user.patterns.build(pattern_params)
    #colors have to come back in {} or it won't save
    if @pattern.save
      redirect_to @pattern, notice: 'Pattern was successfully created.'
    else
      render :index
      flash[:alert] = 'Something went wrong'
    end
  end

  def edit
  end

  def update
    if @pattern.update(pattern_params)
      redirect_to @pattern, notice: 'Pattern was successfully updated.'
    else
      render :edit
      flash[:alert] = 'Something went wrong'
    end
  end

  def destroy
    @pattern.destroy
    redirect_to patterns_url, notice: 'Pattern was successfully destroyed.'
  end

  private

  def set_pattern
    @pattern = Pattern.find(params[:id])
  end

  def pattern_params
    params.require(:pattern).permit(:dataset_id, :colors, :user)
  end
end
