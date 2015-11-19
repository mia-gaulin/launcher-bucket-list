require "spec_helper"

feature "user adds bucket list item" do
  scenario "item added when filled form submitted" do
    visit "/launcher-bucket-list"

    fill_in "Add New Goal to Bucket List", with: "Give a Lightning Talk"
    click_on "Add"

    expect(page).to have_content("Give a Lightning Talk")
  end

  scenario "empty li element is not added when empty is submitted" do
    visit "/groceries"
    click_on "Add"

    expect(page).not_to have_selector("li")
  end
end
