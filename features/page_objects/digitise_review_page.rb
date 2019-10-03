require_relative "sections/govuk_banner.rb"
require_relative "sections/nav_bar.rb"

class DigitiseReviewPage < SitePrism::Page

  section(:govuk_banner, GovukBanner, GovukBanner::SELECTOR)
  section(:nav_bar, NavBar, NavBar::SELECTOR)

  # Heading doesn't work as a selector on this page as it contains '--'
  # See https://github.com/SeleniumHQ/selenium/issues/1656
  element(:caption, ".govuk-caption-l")
  element(:content, "#main-content")
  element(:notes_box, "#notes")
  element(:no_radio, "#status-1", visible: false)
  element(:approved_radio, "#status-2", visible: false)
  element(:lic_review_radio, "#status-4", visible: false)
  element(:submit_button, ".govuk-button")
  element(:status_radio1, "#status-1", visible: false)
  element(:status_radio2, "#status-2", visible: false)

  def submit(args = {})
    notes_box.set(args[:notes_box]) if args.key?(:notes_box)
    status_radio1.click if args.key?(:status) && has_status_radio1?
    submit_button.click
  end

end
