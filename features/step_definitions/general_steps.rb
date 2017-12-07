Given(/^I sign in with valid login details$/) do
  @front_app = FrontOfficeApp.new
  @front_app.start_page.load
  @front_app.start_page.submit
  @front_app.sign_in_page.submit(
    email: Quke::Quke.config.custom["accounts"]["water_user"]["username"],
    password: Quke::Quke.config.custom["accounts"]["water_user"]["password"]
  )
end

When(/^I select "([^"]*)"$/) do |lic_no|
  @front_app.licences_page.submit(licence: lic_no)
  # Stores licence number for later checks
  @licence_number = lic_no
end

Then(/^I am on the abstraction licences page$/) do
  expect(@front_app.licences_page).to have_text("Your water abstraction licences")
end

When(/^I check the licence contact details$/) do
  @front_app.licence_details_page.contact_details.click
end

Then(/^I am on the contact details page$/) do
  expect(@front_app.licences_page.current_url).to include "/contact"
end
