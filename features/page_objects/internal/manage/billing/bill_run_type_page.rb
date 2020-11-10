module Pages
  module Internal
    module Manage

      class BillRunTypePage < BasePage

        def initialize
          current_page_url
        end

        element(:supp_bill_run_type, "#selectedBillingType-2", visible: false)
        element(:two_part_tariff__bill_run_type, "#selectedBillingType-3", visible: false)
        element(:two_part_tariff_season_type, "#twoPartTariffSeason", visible: false)
        element(:annual_bill_run_type, "#selectedBillingType", visible: false)

        def submit_bill_run_type(bill_run_type)
          submit_two_part_tariff_bill_run_type(bill_run_type) if bill_run_type == "Two-part tariff"
          return submit_annual_bill_run_type(bill_run_type) if bill_run_type == "Annual"
          return nil unless bill_run_type == "Supplementary"

          # type = page.find("#selectedBillingType-2", visible: false).value
          # return unless type.casecmp(bill_run_type).zero?
          supp_bill_run_type.click
          continue_button.click
        end

        def submit_two_part_tariff_bill_run_type(_bill_run_type)
          two_part_tariff__bill_run_type.click
          two_part_tariff_season_type.click
          continue_button.click
        end

        def submit_annual_bill_run_type(_bill_run_type)
          annual_bill_run_type.click
          continue_button.click
        end

      end
    end
  end
end
