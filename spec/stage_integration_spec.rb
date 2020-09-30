require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an initial path', {:type => :feature}) do
  it('creates a landing page') do
    visit('/')
    expect(page).to have_content('Woodland')
  end
end

describe('create an initial path', {:type => :feature}) do
  it('creates a landing page') do
    visit('/stages')
    expect(page).to have_content('Lightning & Thunder & Fairies, Oh My!')
  end
end

  describe('create a stage path', {:type => :feature}) do
    it('creates a stage and then goes to the stage page') do
      visit('/stages')
      click_on('Add a new stage')
      expect(page).to have_content("Make a new stage") 
    end
  end

  describe('form successfully submits to add a new stage', {:type => :feature}) do
    it('creates a new stage on the /stages page') do
      visit('/stages')
      click_on('Add a new stage')
      fill_in('stage_name', :with => 'Alma\'s Jammy Experimental Stage')
      click_on('Make a new stage')
      expect(page).to have_content('Jammy') 
    end
  end
