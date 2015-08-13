FactoryGirl.define do
	factory :post do
		image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test_image.jpg')) }
	end
end