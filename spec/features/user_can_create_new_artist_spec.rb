require 'rails_helper'

RSpec.describe "artist new page", type: :feature do
  it "allows user to create a new artist" do
    Artist.new(name: "Talking Heads")

    visit new_artist_path

    fill_in "artist[name]", with: "Frank Ocean"
    click_button 'Create Artist'

    expect(page).to have_content("Frank Ocean")
    expect(page).to_not have_content("Talking Heads")
  end

  it "renders new form if user creates artist with no name" do
    visit new_artist_path

    click_button 'Create Artist'

    # these two lines do the same thing
    expect(page).to have_selector("input[type=submit][value='Create Artist']")
    expect(page).to have_button('Create Artist')

    expect(page).to have_field("Name", with: "")
  end
end
