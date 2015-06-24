require "rails_helper"

feature 'visitor posts a question - sign in or creation does not matter', %Q{
  As a user
  I want to post a question
  So that I can receive help from others

  Acceptance Criteria

  [] I must provide a title that is at least 40 characters long
  [] I must provide a description that is at least 150 characters long
  [] I must be presented with errors if I fill out the form incorrectly
} do

  scenario 'user fills out a form correctly to post a question' do
    visit '/questions/new'

    question_title = "This is a question that hasn't been asked yet"
    question_description = "This is a description that is very long and over 150 characters.
    This is a description that is very long and over 150 characters.
    This is a description that is very long and over 150 characters.
    This is a description that is very long and over 150 characters."

    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content("Your question has been successfully submitted!")
    expect(page).to have_content(question_title)
    expect(page).to have_content(question_description)
    expe
  end

  scenario 'user goes to new question page and fills out form incorrectly' do
    visit '/questions/new'

    click_button 'Add Question'

    expect(page).to have_content('You must have a title that is at least 40 characters long.')
    expect(page).to have_content('You must have a description that is at least 150 characters long.')
  end

end
