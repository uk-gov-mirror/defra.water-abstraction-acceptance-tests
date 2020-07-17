module Pages
  module Internal
    module Manage

      class SendBillRunPage < BasePage

        element(:send_bill_run_link, ".govuk-button")

        def initialize
          current_page_url
        end

        def click_send_bill_run()
          send_bill_run_link.click
        end

      end
    end
  end
end

