require "spec_helper"

feature "Story Management" do

  before do
    @story = create(:story)
    login_as_seed_user
  end

  xit "should have a valid factory" do 
    @story.should be_an_instance_of(Story)
    @story.category.body.should be_an_instance_of(String)
  end

  xscenario "User creates a new story" do
    visit "/stories/new"

    fill_in "Title" , with: ValidString.short
    click_button "Create Story"
    expect(page).to have_text("Story was successfully created.")
  end

  xscenario "User edits a story" do
    visit "/stories/#{@story.id}/edit"
    fill_in "Title" , with: ValidString.short
    click_button "Update Story"
    expect(page).to have_text("Story was successfully updated.")
  end

  xscenario "User can delete a story", js: true do
    visit "/stories"
    expect {
      page.evaluate_script('window.confirm = function() {return true;}') #disable conf
      first(:link, "Destroy").click
    }.to change(Story, :count).by(-1)
  end
end
