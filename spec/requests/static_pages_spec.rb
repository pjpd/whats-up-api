require 'rails_helper'

RSpec.describe 'Static Pages API', type: :request do

  # Test suite for Post /static pages
  describe 'Post /static_pages/is_text_at_url' do

    context 'when the text exists' do
      before { post '/static_pages/is_text_at_url', params: { url: "http://www.xkcd.com", text: "romance" } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns true' do
        expect(response.body).to match(/true/)
      end
    end

    context 'when the text does not exist' do
      before { post '/static_pages/is_text_at_url', params: { url: "http://www.xkcd.com", text: "flimgawoop" } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns true' do
        expect(response.body).to match(/false/)
      end
    end

    context 'when the request does not specify a url' do
      before { post '/static_pages/is_text_at_url', params: { text: "flimgawoop" } }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

    end
  end
end
