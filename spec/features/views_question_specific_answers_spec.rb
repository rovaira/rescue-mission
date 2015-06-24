require 'rails_helper'

feature 'user views answers for a specific question', %Q{
  ```no-highlight
  As a user
  I want to view the answers for a question
  So that I can learn from the answer
} do

# Acceptance Criteria
#
# [X] I must be on the question detail page
# [X] I must only see answers to the question I'm viewing
# [X] I must see all answers listed in order, most recent last
#
# let!(:question) { Question.create(title: "T" * 40, description: "D" * 151) }

# change question_id to random # otherwise won't pass uniqueness validation
# as it's set to be unique w/in the scope of the user_id

# let!(:answer) { Answer.create(answer: "B" * 50, question_id: 2) }

  scenario 'user sees answers in order for a question on its show page' do

    question = FactoryGirl.create(:question, id: 5)

    answer = FactoryGirl.create(:answer, answer: "This is the first answer." * 10)
    second_answer = FactoryGirl.create(:answer, answer: "This is the second answer." * 10)

    visit "questions/#{question.id}"

    fill_in 'answer[answer]', with: answer.answer
    click_button 'Submit your answer'


    fill_in 'answer[answer]', with: second_answer.answer
    click_button 'Submit your answer'


    expect(answer.answer).to appear_before(second_answer.answer)

  end

end
