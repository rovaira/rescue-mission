require 'rails_helper'

feature 'visitor views created questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others

} do

  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  #

  scenario 'user sees the title for each question in order' do
    question = FactoryGirl.create(:question)
    second_question = FactoryGirl.create(:question, title: "This is the second index." * 5, description: "Description" * 15)

    visit '/questions'

    expect(second_question.title).to appear_before(question.title)
  end
end
