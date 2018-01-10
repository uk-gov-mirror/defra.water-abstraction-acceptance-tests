
Given(/^I select Change Password$/) do
  @front_app.licences_page.changepw.click
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
  expect(@front_app.change_password_page.error_heading.text).to include "The passwords you entered didn't match"
end

Given(/^I enter a valid password$/) do
  @front_app.change_password_page.submit(
    password: Quke::Quke.config.custom["accounts"]["water_user1"]["password"],
    confirmpw: Quke::Quke.config.custom["accounts"]["water_user1"]["password"]
  )
end

Given(/^I see the Password Changed screen$/) do
  expect(@front_app.change_password_confirm_page.confirmation.text).to include "Your password has been changed."
end
