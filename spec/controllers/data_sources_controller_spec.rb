require 'rails_helper'

RSpec.describe DataSourcesController, type: :controller do
  describe 'GET index' do
    let(:data_sources) { double('data_sources') }

    before :each do
      allow(DataSource).to receive(:all).and_return(data_sources)
      get :index
    end

    it 'fetches all data sources' do
      expect(DataSource).to have_received(:all)
    end

    it 'assigns all data sources' do
      expect(assigns[:data_sources]).to eql(data_sources)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET new' do
    before :each do
      get :new
    end

    it 'assigns a new data source object' do
      expect(assigns[:data_source]).to be_a_new(DataSource)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:data_source_params) do
      {
        name: 'example source',
        url:  'http://example.com',
        format_id: '1'
      }
    end
    let(:data_source) { DataSource.new(data_source_params) }
    let(:save_result) { true }

    before :each do
      allow(DataSource).to receive(:new).with(data_source_params).and_return(data_source)
      allow(data_source).to receive(:save).and_return(save_result)
      post :create, data_source: data_source_params
    end

    it 'builds a data source record with the given params' do
      expect(DataSource).to have_received(:new).with(data_source_params)
    end

    it 'assigns the built record' do
      expect(assigns[:data_source]).to eq(data_source)
    end

    it 'saves the data source' do
      expect(data_source).to have_received(:save)
    end

    context 'when save is successful' do
      let(:save_result) { true }

      it 'redirects to the index page' do
        expect(response).to redirect_to(data_sources_path)
      end
    end

    context 'when save is not successful' do
      let(:save_result) { false }

      it 're-renders the new template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
