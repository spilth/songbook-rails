require 'rails_helper'

feature 'Songs' do
  scenario 'Adding a Song' do
    visit root_path

    click_link 'Songs'
    click_link 'New Song'

    fill_in 'Title', with: 'Example Song'
    fill_in 'Chords & Lyrics', with: '[C] [F] [C] [G]'

    click_button 'Create Song'

    expect(page).to have_content('Example Song')
    expect(page).to have_content('CFCG')
  end
end
