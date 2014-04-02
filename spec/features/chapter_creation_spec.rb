require "spec_helper"

feature "Chapter Management" do

  let( :authorized_user ){ RequestHelpers::Login.create_logged_in_user }

  scenario  "has a valid factory" do
    authorized_user.should be_an_instance_of( User )
  end

  scenario "User creates a new story and add a chapter" do
    chapter_string = ValidString.short

    visit new_story_path( authorized_user )
    fill_in "story_title", with: ValidString.short
    fill_in "co_author", with: "seed.mcseed_1@gmail.com"
    click_button "Create Story"

    click_link "New Chapter"
    fill_in "chapter_body", with: chapter_string

    click_button "Create Chapter"
    page.should have_content(chapter_string)
  end
end

