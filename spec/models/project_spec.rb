require "rails_helper"

RSpec.describe Project, type: :model do

    context "validations tests" do
        #testing if project has title
        it "ensures the title is present" do
        project = Project.new(description: "Content of the description")
        expect(project.valid?).to eq(false)
        end

        #testing if project has description
        it "ensures the description is present" do
        project = Project.new(title: "Title")
        expect(project.valid?).to eq(false)
        end
        
        #testing if project is able to be saved
        it "should be able to save project" do
        project = Project.new(title: "Title", description: "Some description content goes here")
        expect(project.save).to eq(true)
        end
    end

    context "scopes tests" do
        #testing if project count returns correct amount of projects
        let(:params) { { title: "Title", description: "some description" } }
        before(:each) do
        Project.create(params)
        Project.create(params)
        Project.create(params)
        end

        it "should return all projects" do
        expect(Project.count).to eq(3)
        end
    end
end