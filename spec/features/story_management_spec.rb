require "spec_helper"

feature "Story Management" do

  before do
    @story = create(:story)
  end

  scenario "User creates a new story" do
    visit "/stories/new"
    fill_in "Title" , with: ValidString.short
    fill_in "Picture url" , with: ValidString.url
    click_button "Create Story"
    expect(page).to have_text("Story was successfully created.")
  end

  scenario "User edits a story" do
    visit "/stories/#{@story.id}/edit"
    fill_in "Title" , with: ValidString.short
    fill_in "Picture url" , with: ValidString.url
    click_button "Update Story"
    expect(page).to have_text("Story was successfully updated.")
  end

  scenario "User can delete a story" , js: true do 
    visit "/stories"
    expect {
      page.evaluate_script('window.confirm = function() {return true;}') #disable conf
      first(:link, "Destroy").click
    }.to change(Story, :count).by(-1)
  end
end
