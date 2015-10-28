require "rails_helper"

feature "Requirements" do
  let(:user) { create(:user) }

  before :each do
    sign_in(user)
    Requirement.create(title: "something")
  end

  scenario "shows the requirements" do
    visit requirements_url
    expect(page).to have_content("something")
  end

  private

  def sign_in(user)
    visit sign_in_url
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "password"
    click_button "Sign in"
  end
end
