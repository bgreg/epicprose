require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'active_support/core_ext/string/filters'
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.ignore_hidden_elements = false
Capybara.javascript_driver = :webkit

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include  Devise::TestHelpers, type: :controller
  config.mock_with :rspec
  config.include Rails.application.routes.url_helpers
  config.order = "random"

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
  config.use_transactional_fixtures = false
end

def sign_in_add_chapter_sign_out ( user, story_uri, chapter_string )
    sign_in_user( user )
    visit story_uri
    create_a_chapter( user, chapter_string )
    logout(user)
end

def sign_in_user(user)
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign in"
end

def logout(user)
  click_link user.email
  click_link "Logout"
end

def create_a_chapter( user, chapter_string )
  # save_and_open_page
    click_link "New Chapter"
    fill_in "chapter_body", with: chapter_string
    click_button "Save"
end

def play_a_game( player1, player2, story_title )
    # make a story
    sign_in_user( player1 )
    visit new_story_path( player1 )
    fill_in "story_title", with: story_title
    fill_in "co_author", with: player2.email
    click_button "Create Story"
    story_uri = URI.parse(current_url).path
    logout( player1 )

    # play the story
    sign_in_add_chapter_sign_out( player1, story_uri, ValidString.short )
    sign_in_add_chapter_sign_out( player2, story_uri, ValidString.short )
    sign_in_add_chapter_sign_out( player1, story_uri, ValidString.short )
    sign_in_add_chapter_sign_out( player2, story_uri, ValidString.short )
    sign_in_add_chapter_sign_out( player1, story_uri, ValidString.short )
    sign_in_add_chapter_sign_out( player2, story_uri, ValidString.short )
end
