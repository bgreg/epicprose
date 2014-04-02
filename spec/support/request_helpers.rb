require 'spec_helper'
include Warden::Test::Helpers

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
  end
end
