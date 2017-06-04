require 'rails_helper'

RSpec.describe "Tanks", type: :request do
  describe "GET /tanks" do
    it "works! (now write some real specs)" do
      get tanks_path
      expect(response).to have_http_status(200)
    end
  end
end
