module Pages
  module Internal
    module Manage

      class RemoveBillRunPage < BasePage

        element(:remove_link, ".govuk-button")

        def initialize
          current_page_url
        end

        def click_remove_bill_run
          remove_link.click
        end

      end
    end
  end
end
