require 'rails_helper'

RSpec.describe "artist new page", type: :feature do
  it "allows user to create a new artist" do
    Artist.new(name: "Talking Heads")

    visit '/artists/new'

    fill_in "artist[name]", with: "Frank Ocean"
    click_on 'Save'

    expect(page).to have_content("Frank Ocean")
    expect(page).to_not have_content("Talking Heads")
  end

  it "renders new form if user creates artist with no name" do
    visit '/artists/new'

    click_on 'Save'

    expect(page).to have_selector("input[type=submit][value='Save']")
    expect(page).to have_field("Name", with: "")
  end
end
