require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.ignore_hidden_elements = false
Capybara.javascript_driver = :selenium

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
    click_button "Create Chapter"
end

