require "spec_helper"
describe ChaptersController do
  describe "routing" do
    it "routes to #index" do
      get("/chapters").should_not route_to("chapters#index")
    end

    it "routes to #new" do
      get("/stories/1/chapters/new").should route_to("chapters#new", story_id: "1")
    end

    it "routes to #show" do
      get("/chapters/1").should_not route_to("chapters#show", id: "1")
    end

    it "routes to #edit" do
      get("/chapters/1/edit").should_not be_routable
    end

    it "routes to #create" do
      post("/stories/1/chapters").should route_to("chapters#create", story_id: "1")
    end

    it "routes to #update" do
      put("/chapters/1").should_not be_routable
    end

    it "routes to #destroy" do
      delete("/stories/1/chapters/1").should route_to("chapters#destroy", id: "1", story_id: "1")
    end
  end
end
