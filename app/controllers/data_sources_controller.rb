class DataSourcesController < ApplicationController
  def index
    @data_sources = DataSource.all
  end

  def new
    @data_source = DataSource.new
  end

  def create
    @data_source = DataSource.new(data_source_params)
    if @data_source.save
      redirect_to data_sources_path
    else
      render :new
    end
  end

  private

  def data_source_params
    params.require(:data_source).permit(:name, :url, :format_id)
  end
end
