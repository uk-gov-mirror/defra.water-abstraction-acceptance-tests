class BasePage < SitePrism::Page

  element(:h1_heading, ".govuk-heading-l")
  element(:continue_button, ".govuk-button")
  element(:error_link, :xpath, "//div[contains(@class, 'govuk-error-summary__body')]/ul/li/a")


  def current_page_url
    puts "The page url is: " + page.current_url
  end

end
