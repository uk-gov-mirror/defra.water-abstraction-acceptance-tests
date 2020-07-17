module Pages
  module Internal
    module Manage

      class TwoPartTariffReviewPage < BasePage

        def initialize
          current_page_url
        end

        element(:review_link, :xpath, "//table/tbody/tr[1]/td[4]/a")
        element(:change_link, :xpath, "//table/tbody/tr/td[6]/a")
        element(:authorised_radio, "#quantity", visible: false)
        element(:custom_radio, "#quantity-2", visible: false)
        element(:custom_quantity, "#customQuantity", visible: false)
        element(:remove_license_button, "form button.govuk-button")
        # element(:confirm_button, :xpath, "//*[@id=main-content]/div/div/div[2]/div/form/button")

        def clickReview()
          review_link.click
        end

        # def clickConfirm()
        #   confirm_button.click
        # end

        def clickChange()
          change_link.click
        end

        def click_remove_bill_link
          find_link("Remove from bill run").click
        end

        def setTheBillableQuantity(billable_quantity_type)
          if (billable_quantity_type == "authorised")
            authorised_radio.click
          end
          if (billable_quantity_type == "custom")
            custom_radio.click
            custom_quantity.set("0.2")
          end
        end

        def removeBillRuns(bill_runs_count)
          $i = 0
          $num = bill_runs_count

          while $i < $num  do
            puts("Inside the loop i = #$i" )
            clickReview
            click_remove_bill_link
            remove_license_button.click
            $i +=1
          end
        end

        end
      end
    end
  end
