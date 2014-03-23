require 'spec_helper'

describe "stories/new" do
  before(:each) do
    assign(:story, stub_model(Story,
      :title => "MyString",
      :picture_url => "MyString",
      :user_id => 1,
      :genre_id => 1
    ).as_new_record)
  end

  it "renders new story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stories_path, "post" do
      assert_select "input#story_title[name=?]", "story[title]"
      assert_select "input#story_picture_url[name=?]", "story[picture_url]"
      assert_select "input#story_user_id[name=?]", "story[user_id]"
      assert_select "input#story_genre_id[name=?]", "story[genre_id]"
    end
  end
end
