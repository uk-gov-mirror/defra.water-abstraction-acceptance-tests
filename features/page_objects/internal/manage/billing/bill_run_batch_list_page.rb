module Pages
  module Internal
    module Manage

      class BillRunBatchListPage < BasePage

        def initialize
          current_page_url
        end

        element(:view_bill_link, :xpath, "//table/tbody/tr[1]/td[6]/a[1]")

        def viewBill()
          view_bill_link.click
        end

      end
    end
  end
end
