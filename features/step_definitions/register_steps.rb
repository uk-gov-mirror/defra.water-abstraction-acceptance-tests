
Given(/^I am a new user$/) do
  # No action required
end

Given(/^I register my email address on the service$/) do
  @environment = Quke::Quke.config.custom["current_environment"].to_s
  @front_app = FrontOfficeApp.new
  @front_app.sign_in_page.load
  @front_app.sign_in_page.create_account_link.click
  @front_app.register_create_account_page.create_account_button.click
  @reg_email = @front_app.register_email_page.generate_email.to_s
  @front_app.register_email_page.submit(email_address: @reg_email)
  puts "Random email is: " + @reg_email
end

Given(/^I receive an email with sign in details$/) do
  @environment = Quke::Quke.config.custom["current_environment"].to_s
  @front_app.mailinator_home_page.load
  @front_app.mailinator_home_page.wait_for_inbox
  @front_app.mailinator_home_page.submit(inbox: @reg_email)
  @front_app.mailinator_inbox_page.wait_for_email
  @front_app.mailinator_inbox_page.email[0].from.click

  @front_app.mailinator_inbox_page.email_details do |frame|
    @new_window = window_opened_by { frame.create_password.click }
  end

  within_window @new_window do
    @front_app.register_create_pw_page.submit(
      password: Quke::Quke.config.custom["data"][@environment]["accounts"]["water_user2"]["password"],
      confirmpw: Quke::Quke.config.custom["data"][@environment]["accounts"]["water_user2"]["password"]
    )
  end
end

Given(/^I can sign in with my new email address$/) do
  @environment = Quke::Quke.config.custom["current_environment"].to_s
  @front_app = FrontOfficeApp.new
  @front_app.sign_in_page.load
  @front_app.sign_in_page.submit(
    email: @reg_email.to_s,
    password: Quke::Quke.config.custom["data"][@environment]["accounts"]["water_user2"]["password"]
  )
  Quke::Quke.config.custom["data"][@environment]["accounts"]["water_user2"]["password"]
end

Then(/^I am on the add licences page$/) do
  expect(@front_app.register_add_licences_page.current_url).to include "/add-licences"
  expect(@front_app.register_add_licences_page.heading).to have_text("Which licences do you want to be able to view?")
end

When(/^I register a licence$/) do
  @environment = Quke::Quke.config.custom["current_environment"].to_s
  @licence_reg = Quke::Quke.config.custom["data"][@environment]["licence_reg"].to_s
  @licence_multi = Quke::Quke.config.custom["data"][@environment]["licence_multi"].to_s
  @front_app.register_add_licences_page.wait_for_licence_box
  @front_app.register_add_licences_page.submit(
    licence_box: @licence_multi
  )
  @front_app.register_confirm_licences_page.wait_for_licence_checkbox
  @front_app.register_confirm_licences_page.submit
  @front_app.register_choose_address_page.wait_for_address_radio
  @front_app.register_choose_address_page.submit
end

When(/^I receive a confirmation code$/) do
  # This will show in Dev, not in QA
  @security_code = @front_app.register_sending_letter_page.security_code.text
  puts "Confirmation code is: " + @security_code
end

When(/^an admin user can read the code$/) do
  puts "This step won't work yet"
  # Log in as admin
  # Search for @licence_reg
  # Identify the most recent code and copy to @security_code
  # Log out and back in as the registering user
end

When(/^I am on the confirmation code page$/) do
  expect(@front_app.register_security_code_page.current_url).to include "/security-code"
end

When(/^I enter my confirmation code$/) do
  @front_app.register_security_code_page.submit(
    security_code_box: @security_code
  )
end

When(/^I can select the licence I registered$/) do
  @front_app.licences_page.submit(licence: @licence_reg)
  expect(@front_app.licence_details_page.licence_breadcrumb).to have_text(@licence_reg)
end
