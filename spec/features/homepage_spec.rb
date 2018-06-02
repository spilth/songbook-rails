require 'rails_helper'

feature 'Homepage' do
  scenario 'Visiting the homepage' do
    visit root_path

    expect(page).to have_content('Songbook')
  end
end
