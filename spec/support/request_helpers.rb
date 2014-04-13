require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

#
# logout doesn't work for capybara tests
# login seems to work fine.
#
#
module RequestHelpers
  class Login
    def self.create_logged_in_user
      user = FactoryGirl.create(:user)
      login(user)
      user
    end
    def self.login(user)
      login_as user, scope: :user, run_callbacks: false
    end
    def self.logout(user)
       sign_out( user )
    end
  end
end
