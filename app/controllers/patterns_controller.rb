class PatternsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @pattern = Pattern.new
    @dataset = Dataset.new
  end

  def show
    @data = Pattern.find(params[:id]).dataset.data

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @data }
    end
  end

  def create
    @pattern = current_user.patterns.build(pattern_params)
    #colors have to come back in {} or it won't save
    if @pattern.save
      redirect_to @pattern, notice: 'Pattern was successfully created.'
    else
      flash[:alert] = 'Something went wrong'
      render :index
    end
  end

  def edit
  end

  def update
    if @pattern.update(pattern_params)
      redirect_to @pattern, notice: 'Pattern was successfully updated.'
    else
      flash[:alert] = 'Something went wrong'   #Flash should be above render
      render :edit
    end
  end

  def destroy
    @pattern.destroy
    redirect_to patterns_url, notice: 'Pattern was successfully destroyed.'
  end

  private

  def set_pattern
    @pattern ||= Pattern.find(params[:id])  #optimization using 'hammer operator'
  end

  def pattern_params
    params.require(:pattern).permit(:dataset_id, :colors, :user)
  end
end
