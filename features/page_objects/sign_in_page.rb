class SignInPage < SitePrism::Page

  # Sign in page

  element(:email, "#user-id")
  element(:password, "#password")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)
    submit_button.click
  end

end
