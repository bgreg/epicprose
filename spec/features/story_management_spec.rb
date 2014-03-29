require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "Story Management" do

  before do
    @user = create(:user)
    login_as(@user,:scope => :user)
    @story = create(:story)
  end

  after do
    @user.destroy
    @story.destroy
  end

  it "should have a valid factory" do 
    @story.should be_an_instance_of(Story)
    @story.category.body.should be_an_instance_of(String)
  end

  scenario "User creates a new story", js: true  do
    visit "/stories/new"

    fill_in "Title" , with: ValidString.short
    fill_in "Co author" , with: "seed.mcseed_1@gmail.com"
    click_button "Create Story"
    expect(page).to have_text("Story was successfully created.")
  end

  scenario "User edits a story", js: true  do
    @story = Story.create(title:"test", picture_url:"www.google.com")
    @story.users << @user

    visit "/stories/#{@story.id}/edit"
    save_and_open_page
    fill_in "Title", with: ValidString.short
    click_button "Update Story"
    expect(page).to have_text("Story was successfully updated.")
    @story.destroy
  end

  scenario "User can delete a story", js: true do
    visit "/stories"
    expect {
      page.evaluate_script('window.confirm = function() {return true;}') #disable conf
      first(:link, "Destroy").click
    }.to change(Story, :count).by(-1)
  end
end
