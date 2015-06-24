require 'rails_helper'

feature 'user edits a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do

  # Acceptance Criteria
  #
  # [X] I must provide valid information
  # [X] I must be presented with errors if I fill out the form incorrectly
  # [X] I must be able to get to the edit page from the question details page
#
  let!(:question) { FactoryGirl.create(:question, title: "T" * 40, description: "D" * 151) }

  scenario 'user submits a VALID edit for a question from question details page' do

    visit "questions/#{question.id}"

    new_title = "Valid New Title/Edited & Saved" * 5

    click_link  "Edit Question"

    fill_in "Title", with: new_title
    # fill_in "Description", with: question.description

    click_button "Submit"

    expect(page).to have_content("Content was successfully edited!")
    expect(page).to have_content(new_title)
    expect(page).to have_content(question.description)
  end

  scenario 'user submits an INVALID edit for a question from question details page' do

    invalid_update = Question.create(title: "IA", description: "ID")

    visit "questions/#{question.id}"

    click_link  "Edit Question"

    fill_in "Title", with: invalid_update.title
    fill_in "Description", with: invalid_update.description

    click_button "Submit"

    invalid_update.errors.full_messages.each do |error|
      expect(page).to have_content(error)
    end

    page.find_field('Title').set(invalid_update.title)
    page.find_field('Description').set(invalid_update.description)

  end

end
