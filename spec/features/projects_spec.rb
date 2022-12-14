require 'rails_helper'

RSpec.feature "Projects", type: :feature do

  before(:each) do
    testUser = FactoryBot.create(:user)
    sign_in testUser
    visit new_project_path
    within("#project_form") do
      fill_in "Title", with: "Test title"
    end
  end
  
  context "Create new project" do

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Save Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Save Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("#project_form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Save Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("#project_form") do
        fill_in "Description", with: ""
      end
      click_button "Save Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    #test to make sure that a project can be destroyed
    #edited to click the "show this project" link first and to click "Destory this project" button
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Show Project"
      click_button "Destroy project"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end