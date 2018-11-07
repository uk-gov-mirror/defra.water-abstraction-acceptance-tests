
Given(/^I select Change Password$/) do
  @front_app.licences_page.govuk_banner.wait_for_changepw
  # Wait for helps because the page object is not always found straight away on load
  @front_app.licences_page.govuk_banner.changepw.click
end

Given(/^I am on the Change Password page$/) do
  expect(@front_app.change_password_page.header).to have_text("Change your password")
  expect(@front_app.change_password_page.current_url).to include "/update_password"
end

Given(/^I enter my correct password$/) do
  @front_app.change_password_reauthenticate_page.submit(
    password: Quke::Quke.config.custom["data"]["accounts"]["password"]
  )
end

Given(/^I enter a password which is too short$/) do
  @front_app.change_password_page.submit(
    password: "Is$h0rt",
    confirmpw: "Is$h0rt"
  )
end

Given(/^I enter a password with no uppercase letters$/) do
  @front_app.change_password_page.submit(
    password: "low£rcase",
    confirmpw: "low£rcase"
  )
end

Given(/^I enter a password with no symbols$/) do
  @front_app.change_password_page.submit(
    password: "N0symbol",
    confirmpw: "N0symbol"
  )
end

Given(/^I enter valid passwords which don't match$/) do
  @front_app.change_password_page.submit(
    password: "S0mething?",
    confirmpw: "S0mething!"
  )
end

Given(/^I see an error telling me the password is invalid$/) do
  expect(@front_app.change_password_page.error_heading.text).to include "Please enter a valid password"
end

Given(/^I see an error telling me the passwords don't match$/) do
  expect(@front_app.change_password_page.error_heading.text).to include "The passwords you entered did not match"
end

Given(/^I enter a valid password$/) do
  @front_app.change_password_page.submit(
    password: Quke::Quke.config.custom["data"]["accounts"]["password"],
    confirmpw: Quke::Quke.config.custom["data"]["accounts"]["password"]
  )
end

Given(/^I see the Password Changed screen$/) do
  expect(@front_app.change_password_confirm_page.confirmation.text).to include "Your password has been changed"
end

Given(/^I request a password reset$/) do
  @front_app.sign_in_page.forgotten_password.click
  @front_app.request_pw_reset_page.submit(
    email_address: Quke::Quke.config.custom["data"]["accounts"]["internal_user"]
  )
end

Given(/^I am on the Check Your Email page$/) do
  expect(@front_app.reset_password_check1_page.heading.text).to include "Check your email"
end
