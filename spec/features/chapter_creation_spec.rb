require "spec_helper"

feature "Chapter Management" do
  scenario "User creates a new story and add a chapter" do
    authorized_user =  create(:user)
    chapter_string = ValidString.short
    visit "/"

    sign_in_user( authorized_user )
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

feature "Playing the game, " do
  scenario "Two users can play a game and it will show completed when done" do
    story_title = ValidString.short
    chapter_string = ValidString.short
    player1 = create(:user)
    player2 = create(:user) 
    visit "/"

    play_a_game( player1, player2, story_title )
    sign_in_user( player1 )

    page.all("td").each do |td|
      next unless td.has_selector?( "h3" , text: story_title )
      page.should have_content("completed")
    end
  end
  scenario "Two users can play a game and it will not show your turn on a completed story",js:true do
    story_title = ValidString.short
    chapter_string = ValidString.short
    player1 = create(:user)
    player2 = create(:user)
    visit "/"

    play_a_game( player1, player2, story_title )
    sign_in_user( player1 )

    page.all("td").each do |td|
      next unless td.has_selector?( "h3" , text: story_title )
      page.should_not have_content("Your turn")
    end
  end

  feature "Viewing stories on the dashboard" do
    scenario 'User1 should start a story with user2, and it should only show up once on each dashboard' do
      story_title = ValidString.short
      chapter_string = ValidString.short
      player1 = create(:user)
      player2 = create(:user) 
      visit "/"

      play_a_game( player1, player2, story_title )
      sign_in_user( player1 )
      page.should have_xpath('//h3', text: story_title, count: 1)
    end
  end
end

