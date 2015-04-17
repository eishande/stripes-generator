class GraphController < ApplicationController
  def index
  end

  def data
    @data = [
      30, 37, 33, 43, 39, 24, 38, 42, 48, 48,
      57, 43, 40, 39, 41, 45, 51, 30, 34, 32,
      41, 39, 33, 35, 49, 56, 44, 40, 42, 45, 50]
    respond_to do |format|
      format.json {
        render :json => @data
      }
    end
  end
end
