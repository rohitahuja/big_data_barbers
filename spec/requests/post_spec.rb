require 'rails_helper'

describe 'Post' do
  include CarrierWave::Test::Matchers

	context 'GET /api/v1/professional_accounts/:professional_account_id/posts' do
		it 'gets only the posts under the user' do
			user_1 = login_user
			professional_account_1 = FactoryGirl.create(:professional_account, user_id: user_1.id)
			post_1 = FactoryGirl.create(:post, professional_account_id: professional_account_1.id)
		
			user_2 = FactoryGirl.create(:user)
			professional_account_2 = FactoryGirl.create(:professional_account, user_id: user_2.id)
			post_2 = FactoryGirl.create(:post, professional_account_id: professional_account_2.id)

			get "/api/v1/professional_accounts/#{professional_account_1.id}/posts", nil, request_header

			expect(response).to be_success
			expect(json['posts'].length).to eq(1)
			expect(json['posts'][0]['id']).to eq(post_1.id)
		end
	end
  
  context 'POST /api/v1/professional_accounts/:professional_account_id/posts' do
  	it 'creates a post under a user' do
  		user = login_user
  		professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
  		
      file = 'hello world'
  		params = { post: { image: Base64.encode64(file), professional_account_id: professional_account.id } }

  		post "/api/v1/professional_accounts/#{professional_account.id}/posts", params, request_header

  		expect(response).to be_success

  		expect(json['image_url']).to eq(professional_account.posts[0].image.url)
      binding.pry
      professional_account.posts[0].remove_image!
      professional_account.save
  	end
  end

  context 'GET /api/v1/posts/:id' do
    it 'gets a post' do 
      user = login_user
      professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
      post = FactoryGirl.create(:post, professional_account_id: professional_account.id)

      get "/api/v1/posts/#{post.id}"

      expect(response).to be_success

      expect(json['id']).to eq(post.id)
    end
  end

  # context 'PUT /api/v1/professional_accounts/:id' do
  #   # not that important yet
  # end
end