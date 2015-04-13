class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @patterns = Pattern.all
  end

  def show
  end

  def new
    @pattern = Pattern.new
  end

  def edit
  end

  def create
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      redirect_to @pattern, notice: 'Pattern was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @pattern.update(pattern_params)
        format.html { redirect_to @pattern, notice: 'Pattern was successfully updated.' }
        format.json { render :show, status: :ok, location: @pattern }
      else
        format.html { render :edit }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
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
    params.require(:pattern).permit()
  end
end
