require "rails_helper"

RSpec.describe TasksController, type: :controller do
    it "is valid with a title, description, due_date, status, user_id" do
        task = Task.new(
            title: "Mr",
            description: "This is a description",
            due_date: "Date.today",
            status: "pending",
            user_id: 9
        )
        expect(task).to be_valid
    end

it "is invalid without a title" do
    task = Task.new(title: nil)
    task.valid?
    expect(task.errors[:title]). to include("can't be blank")
end
end