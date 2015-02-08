require "spec_helper"

feature "Story Management", js: true do

  let( :authorized_user ){ RequestHelpers::Login.create_logged_in_user }

  scenario  "has a valid factory" do
    authorized_user.should be_an_instance_of( User )
  end

  scenario "Can visit root" do
     visit root_path( authorized_user )
     page.should have_content( "Your Stories" )
  end

  scenario "should login without being retarded" do
     visit root_path( authorized_user )
     page.should have_content( "Your Stories" )
  end

  scenario "You should not be able to add yourself to a story" do
    visit new_story_path( authorized_user )
    fill_in "story_title", with: ValidString.short

    fill_in "co_author", with: authorized_user.email
    click_button "Create Story"

    expect( page ).to have_text( "valid co-author email required" )
  end

  scenario "User creates a new story" do
    visit new_story_path( authorized_user )
    fill_in "story_title", with: ValidString.short

    fill_in "co_author", with: "seed.mcseed_1@gmail.com"
    click_button "Create Story"
    expect( page ).to have_text( "Story was successfully created." )
  end

  scenario "User cannot create an empty story" do
    visit new_story_path( authorized_user )
    fill_in "story_title", with: ""
  
    fill_in "co_author", with: ""
    click_button "Create Story"
  end

  scenario "User can delete a story" do
    visit new_story_path( authorized_user )
    title  = ValidString.short
    fill_in "story_title", with: title

    fill_in "co_author", with: "seed.mcseed_1@gmail.com"
    click_button "Create Story"

    expect(page).to have_content("Story was successfully")

    visit stories_path( authorized_user )
    page.evaluate_script('window.confirm = function() {return true;}')
    click_link("Delete").first

    expect(page).to_not have_content(title)
  end
end
