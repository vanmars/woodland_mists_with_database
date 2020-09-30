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

  describe('create a stage path', {:type => :feature}) do
    it('creates a stage and then goes to the stage page') do
      visit('/stages')
      click_on('Add a new stage')
      expect(page).to have_content("Make a new stage") 
    end
  end
end