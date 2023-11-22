require "rails_helper"

RSpec.describe CategoryEntitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/category_entities").to route_to("category_entities#index")
    end

    it "routes to #new" do
      expect(get: "/category_entities/new").to route_to("category_entities#new")
    end

    it "routes to #show" do
      expect(get: "/category_entities/1").to route_to("category_entities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/category_entities/1/edit").to route_to("category_entities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/category_entities").to route_to("category_entities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/category_entities/1").to route_to("category_entities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/category_entities/1").to route_to("category_entities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/category_entities/1").to route_to("category_entities#destroy", id: "1")
    end
  end
end
