require "application_system_test_case"

class LeaksTest < ApplicationSystemTestCase
  setup do
    @leak = leaks(:one)
  end

  test "visiting the index" do
    visit leaks_url
    assert_selector "h1", text: "Leaks"
  end

  test "creating a Leak" do
    visit leaks_url
    click_on "New Leak"

    fill_in "Content", with: @leak.content
    click_on "Create Leak"

    assert_text "Leak was successfully created"
    click_on "Back"
  end

  test "updating a Leak" do
    visit leaks_url
    click_on "Edit", match: :first

    fill_in "Content", with: @leak.content
    click_on "Update Leak"

    assert_text "Leak was successfully updated"
    click_on "Back"
  end

  test "destroying a Leak" do
    visit leaks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leak was successfully destroyed"
  end
end
