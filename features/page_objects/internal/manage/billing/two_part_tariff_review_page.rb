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

        def click_review
          review_link.click
        end

        # def clickConfirm()
        #   confirm_button.click
        # end

        def click_change
          change_link.click
        end

        def click_remove_bill_link
          find_link("Remove from bill run").click
        end

        def the_billable_quantity(billable_quantity_type)
          authorised_radio.click if billable_quantity_type == "authorised"
          return unless billable_quantity_type == "custom"

          custom_radio.click
          #custom_quantity.set("0.2")
        end

        def set_custom_quantity(quantity)
          custom_quantity.set(quantity)
        end

        def remove_bill_runs(bill_runs_count)
          @i = 0
          @num = bill_runs_count

          while @i < @num
            puts("Inside the loop i = #{@i}")
            click_review
            click_remove_bill_link
            remove_license_button.click
            @i += 1
          end
        end
      end
    end
  end
end
