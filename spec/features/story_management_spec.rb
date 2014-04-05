require "spec_helper"

feature "Story Management" do

  let( :authorized_user ){ RequestHelpers::Login.create_logged_in_user }

  scenario  "has a valid factory" do
    authorized_user.should be_an_instance_of( User )
  end

  scenario "Can visit root", js:true do
     visit root_path( authorized_user )
     page.should have_content( "Your Stories" )
  end

  scenario "should login without being retarded", js: true do
     visit root_path( authorized_user )
     page.should have_content( "Your Stories" )
  end

  scenario "User creates a new story", js: true do
    visit new_story_path( authorized_user )
    fill_in "story_title", with: ValidString.short

    fill_in "co_author", with: "seed.mcseed_1@gmail.com"
    click_button "Create Story"
    expect( page ).to have_text( "Story was successfully created." )
  end

  scenario "User can delete a story", js: true do
    visit new_story_path( authorized_user )
    fill_in "story_title", with: ValidString.short

    fill_in "co_author", with: "seed.mcseed_1@gmail.com"
    click_button "Create Story"

    visit stories_path( authorized_user )
    expect {
      page.evaluate_script( 'window.confirm = function() {return true;}' )
      click_link(  "Delete"  ).first
    }.to change( Story, :count ).by( -1 )
  end
end
