require 'spec_helper'

describe StoriesController do

  # This should return the minimal set of attributes required to create a valid
  # Story. As you add validations to Story, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString", "picture_url" => "http://www.google.com"} }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all stories as @stories" do
      story = Story.create! valid_attributes
      get :index, {}, valid_session
      assigns(:stories).should eq([story])
    end
  end

  describe "GET show" do
    it "assigns the requested story as @story" do
      story = Story.create! valid_attributes
      get :show, {:id => story.to_param}, valid_session
      assigns(:story).should eq(story)
    end
  end

  describe "GET new" do
    it "assigns a new story as @story" do
      get :new, {}, valid_session
      assigns(:story).should be_a_new(Story)
    end
  end

  describe "GET edit" do
    it "assigns the requested story as @story" do
      story = Story.create! valid_attributes
      get :edit, {:id => story.to_param}, valid_session
      assigns(:story).should eq(story)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Story" do
        expect {
          post :create, {:story => valid_attributes}, valid_session
        }.to change(Story, :count).by(1)
      end

      it "assigns a newly created story as @story" do
        post :create, {:story => valid_attributes}, valid_session
        assigns(:story).should be_a(Story)
        assigns(:story).should be_persisted
      end

      it "redirects to the created story" do
        post :create, {:story => valid_attributes}, valid_session
        response.should redirect_to(Story.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved story as @story" do
        # Trigger the behavior that occurs when invalid params are submitted
        Story.any_instance.stub(:save).and_return(false)
        post :create, {:story => { "title" => "invalid value" }}, valid_session
        assigns(:story).should be_a_new(Story)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Story.any_instance.stub(:save).and_return(false)
        post :create, {:story => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested story" do
        story = Story.create! valid_attributes
        # Assuming there are no other stories in the database, this
        # specifies that the Story created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Story.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => story.to_param, :story => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested story as @story" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => valid_attributes}, valid_session
        assigns(:story).should eq(story)
      end

      it "redirects to the story" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => valid_attributes}, valid_session
        response.should redirect_to(story)
      end
    end

    describe "with invalid params" do
      it "assigns the story as @story" do
        story = Story.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Story.any_instance.stub(:save).and_return(false)
        put :update, {:id => story.to_param, :story => { "title" => "invalid value" }}, valid_session
        assigns(:story).should eq(story)
      end

      it "re-renders the 'edit' template" do
        story = Story.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Story.any_instance.stub(:save).and_return(false)
        put :update, {:id => story.to_param, :story => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested story" do
      story = Story.create! valid_attributes
      expect {
        delete :destroy, {:id => story.to_param}, valid_session
      }.to change(Story, :count).by(-1)
    end

    it "redirects to the stories list" do
      story = Story.create! valid_attributes
      delete :destroy, {:id => story.to_param}, valid_session
      response.should redirect_to(stories_url)
    end
  end

end
