class DatasetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_dataset, only: [:edit, :update, :destroy]

  def index
    @datasets = Dataset.where(:user_id == current_user.id)
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = current_user.datasets.build(dataset_params)
    #right now Data has to be enclosed in {} braces or it won't save
    if @dataset.save
      redirect_to root_path, notice: 'Dataset was successfully created.'
    else
      render :new
      flash[:alert] = 'Something went wrong'
    end
  end

  private

  def set_dataset
    @dataset = Dataset.find(params[:id])
  end

  def dataset_params
    params.require(:dataset).permit(:data, :name, :user)
  end
end
