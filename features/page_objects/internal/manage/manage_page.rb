module Pages
  module Internal
    class ManagePage < BasePage

      element(:continue_button, "form button.govuk-button")
      element(:confirm_button, "form button.govuk-button")
      element(:back_link, "a.govuk-back-link")

      def initialize
        current_page_url
      end

      def click_tab(section)
        find("#navbar-notifications", text: section).click
      end

      def click_paper_forms
        find_link("Paper forms").click
      end

      def click_invitations
        find_link("Invitations").click
      end

      def click_reminders
        find_link("Reminders").click
      end

      def create_a_bill_run
        find_link("Create a bill run").click
      end

      def view_past_open_bill_runs
        find_link("View past and open bill runs").click
      end

      def click_remove_bill_link
        find_link("Remove from bill run").click
      end

      def click_confirm_bill_run_link
        find_link("Confirm bill run").click
      end

      def click_continue_button
        continue_button.click
      end

      def click_continue1_button
        find_link("Continue").click
      end

      def click_confirm_button
        confirm_button.click
      end

      def click_back_link
        find_link("Back").click
      end

    end
  end
end
