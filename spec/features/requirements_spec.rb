require "rails_helper"

feature "Requirements" do
  before :each do
    Requirement.create(title: "something")
  end

  scenario "shows the requirements" do
    visit requirements_url
    expect(page).to have_content("something")
  end
end
