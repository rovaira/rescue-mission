require 'rails_helper'

feature 'visitor views created questions', %q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  # Acceptance Criteria
  #
  # [X] I must see the title of each question
  # [X] I must see questions listed in order, most recently posted first

# let (:question) { FactoryGirl.create{:question} }

scenario 'user sees the title for each question in order' do
# byebug
    question = FactoryGirl.create(:question)
    second_question = FactoryGirl.create(:question, title: "This is the second index which we should see first as it is the most recent.", description: "THIS IS A DIFFERENT DESCRIPTION. I wonder when we'll reach 150 characters. It seems like it might take forever.  Why did we not use a shorter limit?  Okay, fine.  We'll keep writing.  Still writing.  What do you think about Breakable Toys?  Do you know what you're doing?  Yay for being more than half way done!")

    visit '/questions'

    expect(second_question.title).to appear_before(question.title)

  end
end
