
Given(/^I search for a partial licence number$/) do
  @expected_search_result = "28/09"
  @expected_result_count = 16
  @front_app.licences_page.search(
    search_form: @expected_search_result.to_s
  )
end

Given(/^all licences containing that term are shown on screen$/) do
  @licences_page = @front_app.licences_page
  @licence_results = [@licences_page.licence_result_no.text, @licences_page.licence_result_name.text]
  expect(@licence_results).to have_text(@expected_search_result.to_s)
  expect(@licences_page).to have_view_links count: @expected_result_count.to_i
end

Given(/^I search for a partial licence name$/) do
  @expected_search_result = "Swynn"
  @expected_result_count = 1
  @front_app.licences_page.search(
    search_form: @expected_search_result.to_s
  )
end

Given(/^I enter a search term which does not exist on screen$/) do
  @expected_search_result = "marmite" # change to "spring" once 'licence holder' defect is fixed
  @expected_result_count = 0
  @front_app.licences_page.search(
    search_form: @expected_search_result.to_s
  )
end

Given(/^I cannot see any licences$/) do
  expect(@front_app.licences_page).to have_text("No results found.")
end

Given(/^I remove a search term$/) do
  @expected_search_result = ""
  @expected_result_count = @total_licences
  @front_app.licences_page.search(
    search_form: @expected_search_result.to_s
  )
end

Given(/^I can see the original number of licences$/) do
  expect(@front_app.licences_page).to have_view_links count: @total_licences.to_i
end

Given(/^I select the licence name heading$/) do
  @front_app.licences_page.licencename_link.click
end

Given(/^the table is sorted by licence name in ascending order$/) do
  expect(@front_app.licences_page.licencename_link.text).to have_text("Licence name ▲")
end

Given(/^I select the licence number heading$/) do
  @front_app.licences_page.serialno_link.click
end

Given(/^the table is sorted by licence number in ascending order$/) do
  @environment = Quke::Quke.config.custom["current_environment"].to_s
  @top_licence = Quke::Quke.config.custom["data"][@environment]["licence_top"].to_s
  @btm_licence = Quke::Quke.config.custom["data"][@environment]["licence_bottom"].to_s
  expect(@front_app.licences_page.serialno_link.text).to have_text("Licence serial number ▲")
  expect(page.body.index(@top_licence)).to be < page.body.index(@btm_licence)
end

Given(/^I enter an email address on the licence holder's email field$/) do
  @environment = Quke::Quke.config.custom["current_environment"].to_s
  @expected_search_result = @licence_reg
  # Quke::Quke.config.custom["data"][@environment]["licence_searchterm"].to_s
  @expected_result_count = 1
  @front_app.licences_page.search(
    email_form: @reg_email
  )
end
