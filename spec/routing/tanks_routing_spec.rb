require "rails_helper"

RSpec.describe TanksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tanks").to route_to("tanks#index")
    end

    it "routes to #new" do
      expect(:get => "/tanks/new").to route_to("tanks#new")
    end

    it "routes to #show" do
      expect(:get => "/tanks/1").to route_to("tanks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tanks/1/edit").to route_to("tanks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tanks").to route_to("tanks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tanks/1").to route_to("tanks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tanks/1").to route_to("tanks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tanks/1").to route_to("tanks#destroy", :id => "1")
    end

  end
end
