require 'rails_helper'

feature 'user answers a question', %Q{
  ```no-highlight
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

} do
  # Acceptance Criteria
  #
  # [X] I must be on the question detail page
  # [X] I must provide a description that is at least 50 characters long
  # [X] I must be presented with errors if I fill out the form incorrectly
  #

  let!(:question) { Question.create(title: "T" * 40, description: "D" * 151) }

  let!(:invalid_answer) { Answer.create(answer: "IA", question_id: question.id) }

  scenario 'user goes to question detail page and provides a VALID answer' do

    visit "questions/#{question.id}"

    answer = "B" * 50

    fill_in 'answer[answer]', with: answer

    click_button 'Submit Answer'

    expect(page).to have_content("Your answer was successfully submitted!")
    expect(page).to have_content(answer)
  end

  scenario 'user goes to question detail page and provides an INVALID answer' do

    visit "questions/#{question.id}"

    invalid_answer

    click_button "Submit Answer"

    invalid_answer.errors.full_messages.each do |error|
      expect(page).to have_content(error)
    end
    # save_and_open_page
  end
end
