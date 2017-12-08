Given(/^I sign in with valid login details$/) do
  @front_app = FrontOfficeApp.new
  @front_app.start_page.load
  @front_app.start_page.submit
  @front_app.sign_in_page.submit(
    email: Quke::Quke.config.custom["accounts"]["water_user"]["username"],
    password: Quke::Quke.config.custom["accounts"]["water_user"]["password"]
  )
end

Given(/^I am in the sign in page$/) do
  @front_app = FrontOfficeApp.new
  @front_app.start_page.load
  @front_app.start_page.submit
end

When(/^I enter my password incorrectly$/) do
  @front_app.sign_in_page.submit(
    email: Quke::Quke.config.custom["accounts"]["water_user"]["username"],
    password: "@3kjldjfa@"
  )
end

When(/^I sign in with the correct credentials$/) do
  @front_app.sign_in_page.submit(
    email: Quke::Quke.config.custom["accounts"]["water_user"]["username"],
    password: Quke::Quke.config.custom["accounts"]["water_user"]["password"]
  )
end

Then(/^I am informed "([^"]*)"$/) do |message|
  expect(@front_app.sign_in_page).to have_text(message)
end
# rubocop:disable Metrics/LineLength
Given(/^I lock my account by attempting to sign in with an incorrect password too many times$/) do
  @front_app = FrontOfficeApp.new
  @front_app.start_page.load
  @front_app.start_page.submit
  # Ten is the magic number..
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
  @front_app.sign_in_page.submit_incorrect_password(email: Quke::Quke.config.custom["accounts"]["water_user"]["username"])
end
# rubocop:enable Metrics/LineLength
When(/^I receive an email informing me my account is locked$/) do
  pending # Needs a mailinator account before finishing this scenario
end
