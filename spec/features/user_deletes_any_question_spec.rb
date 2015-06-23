require "rails_helper"

feature 'visitor deletes a question - sign in or creation does not matter', %Q{
  As a user
I want to delete a question
So that I can delete duplicate questions

Acceptance Criteria

[] I must be able delete a question from the question edit page
[] I must be able delete a question from the question details page
[] All answers associated with the question must also be deleted
} do

scenario 'user deletes a question' do
    question = FactoryGirl.create(:question)

    visit '/questions'

    click_link 'Delete'
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
