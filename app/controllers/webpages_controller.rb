class WebpagesController < ApplicationController
  before_action :set_collection
  before_action :set_collection_webpage, only: [:show, :update, :destroy]

  # GET /collection/:collection_id/webpages
  def index
    json_response(@collection.webpages)
  end

  # GET /collection/:collection_id/webpages/:id
  def show
    json_response(@webpage)
  end

  # POST /collection/:collection_id/webpages
  def create
    @collection.webpages.create!(webpage_params)
    json_response(@collection, :created)
  end

  # PUT /collection/:collection_id/webpages/:id
  def update
    @webpage.update(webpage_params)
    head :no_content
  end

  # DELETE /collections/:collection_id/webpage/:id
  def destroy
    @webpage.destroy
    head :no_content
  end

  private

  def webpage_params
    params.permit(:name, :url, :text)
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_collection_webpage
    @webpage = @collection.webpages.find_by!(id: params[:id]) if @collection
  end

end
