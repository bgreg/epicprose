require 'spec_helper'

describe "stories/edit" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :title => "MyString",
      :picture_url => "MyString",
      :user_id => 1,
      :genre_id => 1
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", story_path(@story), "post" do
      assert_select "input#story_title[name=?]", "story[title]"
      assert_select "input#story_picture_url[name=?]", "story[picture_url]"
      assert_select "input#story_user_id[name=?]", "story[user_id]"
      assert_select "input#story_genre_id[name=?]", "story[genre_id]"
    end
  end
end
