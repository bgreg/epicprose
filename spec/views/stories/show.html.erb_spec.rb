require 'spec_helper'

describe "stories/show" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :title => "Title",
      :picture_url => "Picture Url",
      :user_id => 1,
      :genre_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Picture Url/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
