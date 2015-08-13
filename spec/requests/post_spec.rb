require 'rails_helper'

describe 'Post' do
  include CarrierWave::Test::Matchers

	context 'GET /api/v1/professionals/:professional_id/posts' do
		it 'gets only the posts under the user' do
			professional_1 = login_user('professional')

			post_1 = FactoryGirl.create(:post, professional_id: professional_1.id)
		
			professional_2 = FactoryGirl.create(:professional)
			post_2 = FactoryGirl.create(:post, professional_id: professional_2.id)

			get "/api/v1/professionals/#{professional_1.id}/posts", nil, request_header

			expect(response).to be_success
			expect(json['posts'].length).to eq(1)
			expect(json['posts'][0]['id']).to eq(post_1.id)
		end
	end
  
  context 'POST /api/v1/professionals/:professional_id/posts' do
  	it 'creates a post under a professional' do
  		professional = login_user('professional')
  		
      file = 'hello world'
  		params = { post: { image: Base64.encode64(file), professional_id: professional.id } }

  		post "/api/v1/professionals/#{professional.id}/posts", params, request_header

  		expect(response).to be_success

  		expect(json['image_url']).to eq(professional.posts[0].image.url)
      professional.posts[0].remove_image!
      professional.save
  	end
  end

  context 'GET /api/v1/posts/:id' do
    it 'gets a post' do 
      professional = login_user('professional')
      post = FactoryGirl.create(:post, professional_id: professional.id)

      get "/api/v1/posts/#{post.id}"

      expect(response).to be_success

      expect(json['id']).to eq(post.id)
    end
  end

  # context 'PUT /api/v1/professionals/:id' do
  #   # not that important yet
  # end
end