class SignInPage < SitePrism::Page

  element(:email, "#user-id")
  element(:password, "#password")
  element(:disabled_submit_button, "input[aria-disabled='true']")
  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)
    submit_button.click
  end

  def lock_account(args = {})
    attempts = 0
    until attempts == 10
      next if has_disabled_submit_button?
      email.set(args[:email]) if args.key?(:email)
      password.set "@3kjldjfa@"
      submit_button.click
      attempts += 1
    end
  end

end
