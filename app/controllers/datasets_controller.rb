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
    if @dataset.save
      redirect_to root_path, notice: 'Dataset was successfully created.'
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  def edit
  end

  def update
    if @dataset.update(dataset_params)
      redirect_to datasets_path, notice: 'Dataset was successfully updated.'
    else
      flash[:alert] = 'Something went wrong'   #Flash should be above render
      render :edit
    end
  end

  def destroy
    @dataset.destroy
    redirect_to datasets_path, notice: 'Dataset deleted.'
  end

  private

  def set_dataset
    @dataset = Dataset.find(params[:id])
  end

  def dataset_params
    params.require(:dataset).permit(:data, :name, :user)
  end
end
