module Pages
  module Internal
    module Manage

      class AnnualBillPage < BasePage

        def initialize
          current_page_url
        end

        element(:other_abstractors_tab, :xpath, "//*[@id='tab_other-abstractors']")
        element(:view_link, :xpath, "//*[@id='other-abstractors']/table/tbody/tr/td[5]/a")

        def click_other_abstrators_tab
          other_abstractors_tab.click
        end

        def click_view_link
          view_link.click
        end

      end
    end
  end
end
