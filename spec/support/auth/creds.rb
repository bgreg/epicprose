def login_as_seed_user
  visit "/"
  fill_in "Email", with: "seed.mcseed_1@gmail.com"
  fill_in "Password", with: '12341234'
  click_button "Sign in"
end
