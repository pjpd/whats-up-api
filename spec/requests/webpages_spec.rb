require 'rails_helper'

RSpec.describe 'Webpages API' do
  # Initialize the test data
  let!(:collection) { create(:collection) }
  let!(:webpages) { create_list(:webpage, 20, collection_id: collection.id) }
  let(:collection_id) { collection.id }
  let(:id) { webpages.first.id }

  # Test suite for GET /collections/:collection_id/webpages
  describe 'GET /collections/:collection_id/webpages' do
    before { get "/collections/#{collection_id}/webpages" }

    context 'when collection exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all collection webpages' do
        expect(json.size).to eq(20)
      end
    end

    context 'when collection does not exist' do
      let(:collection_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Collection/)
      end
    end
  end

  # Test suite for GET /collections/:collection_id/webpages/:id
  describe 'GET /collections/:collection_id/webpages/:id' do
    before { get "/collections/#{collection_id}/webpages/#{id}" }

    context 'when collection webpage exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the webpage' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when collection webpage does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a message not found' do
        expect(response.body).to match(/Couldn't find Webpage/)
      end
    end
  end

  # Test suite for PUT /collections/:collection_id/webpages
  describe 'POST /collections/:collection_id/webpages' do
    let(:valid_attributes) { { name: 'XKCD', url: 'www.xkcd.com', text: 'A webcomic of romance' } }

    context 'when request attributes are valid' do
      before { post "/collections/#{collection_id}/webpages", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/collections/#{collection_id}/webpages/", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a faulure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /colelctions/:collection_id/webpages/:id
  describe 'POST /collections/:collection_id/webpages/:id' do
    let(:valid_attributes) { { name: 'Fruit Salid', url: 'www.fruitsalid.com', text: 'Fruit Salid' } }

    before { put "/collections/#{collection_id}/webpages/#{id}", params: valid_attributes }

    context 'when webpage exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the webpage' do
        updated_webpage= Webpage.find(id)
        expect(updated_webpage.name).to match(/Fruit Salid/)
        expect(updated_webpage.url).to match(/www.fruitsalid.com/)
        expect(updated_webpage.text).to match(/Fruit Salid/)
      end
    end

    context 'when the webpage doesn\'t exist' do
      let(:id) { 0 }

      it 'reutrns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Webpage/)
      end
    end
  end

  # Test suite for DELETE /webpages/:id
  describe 'DELETE /webpages/:id' do
    before { delete "/collections/#{collection_id}/webpages/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
