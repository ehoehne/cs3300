require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  #scenario to test whether homepage has projects
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end
