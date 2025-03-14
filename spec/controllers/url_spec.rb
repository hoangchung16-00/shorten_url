require 'rails_helper'

FactoryBot.define do
  factory :short_url do
    url { 'https://example.com/this-is-original-url' }
    slug { 'abc123' }
  end
end

describe 'UrlController', type: :request do
  describe 'POST /encode' do
    it 'returns a short url' do
      post '/encode', params: { url: 'https://example.com' }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include 'short_url'
    end

    it 'returns error' do
      post '/encode'
      expect(response).to have_http_status(:unprocessable_content)
    end
  end

  describe 'POST /decode' do
    let!(:url) { FactoryBot.create(:short_url) }

    it 'return original url' do
      post '/decode', params: { short_url: "http://localhost:3000/#{url.slug}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include 'url'
    end

    it 'returns error not found' do
      post '/decode', params: { short_url: 'http://not-exist-url.com' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
