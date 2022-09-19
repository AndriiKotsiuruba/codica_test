# frozen_string_literal: true

class Header < SitePrism::Section
  set_default_search_arguments ".navbar"

  element :brand, "a.navbar-brand"

  element :dropdown_menu, "button.navbar-toggle"

  element :home_link, "li a", text: I18n.t(".link.to_home")
  element :doctors_link, "li a", text: I18n.t(".link.to_doctors")
  element :my_account_link, "li a", text: I18n.t(".link.to_my_account")

  expected_elements :brand, :dropdown_menu
end
