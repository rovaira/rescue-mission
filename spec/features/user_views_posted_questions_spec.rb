require 'rails_helper'

feature 'visitor views created questions', %q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  # Acceptance Criteria
  #
  # [] I must see the title of each question
  # [] I must see questions listed in order, most recently posted first

let (:question) { FactoryGirl.create{:question} }

scenario 'user sees the title for each question in order' do
    question = FactoryGirl.create(:question, title: 'Need a title that is longer than 40 characters',
                                  description: 'This description is absolutely longer than 150 characters, I think.  Okay, maybe it needs a little more. This description is absolutely longer than 150 characters, I think.  Okay, maybe it needs a little more. ')

    visit '/questions'

    expect(page).to have_content(question.title)
  end

end
