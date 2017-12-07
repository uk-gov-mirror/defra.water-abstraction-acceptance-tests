class LicenceTermsPage < SitePrism::Page

  element(:back_link, ".link-back")

  element(:source, ".subsection:nth-child(1) .js-subsection-button")
  element(:point, ".subsection:nth-child(2) .js-subsection-button")
  element(:purpose, ".subsection:nth-child(3) .js-subsection-button")
  element(:means_of_abstraction, ".subsection:nth-child(4) .js-subsection-button")
  element(:means_of_measurement, ".subsection:nth-child(5) .js-subsection-button")
  element(:max_quantities, ".subsection:nth-child(6) .js-subsection-button")

end
