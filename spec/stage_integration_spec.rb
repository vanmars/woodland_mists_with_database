require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '#Stage' do

  before(:each) do
    Stage.clear()
  end

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

  describe('creates a stage/id path', {:type => :feature}) do
    it('creates a new view when an individual stage is clicked on') do
      visit('/stages')
      click_on('Add a new stage')
      fill_in('stage_name', :with => 'Alma\'s Jammy Experimental Stage')
      click_on('Make a new stage')
      click_on('Alma\'s Jammy Experimental Stage')
      expect(page).to have_content('Stage Name:')
    end
  end

  describe('creates a stage edit path', {:type => :feature}) do
    it('creates a new view when edit stage is clicked on') do
      visit('/stages')
      click_on('Add a new stage')
      fill_in('stage_name', :with => 'Alma\'s Jammy Experimental Stage')
      click_on('Make a new stage')
      click_on('Alma\'s Jammy Experimental Stage')
      click_on('Edit stage')
      expect(page).to have_content('Rename stage')
    end
  end

  describe('creates a stage edit path', {:type => :feature}) do
    it('creates a new view when edit stage is clicked on') do
      visit('/stages')
      click_on('Add a new stage')
      fill_in('stage_name', :with => 'Alma\'s Jammy Experimental Stage')
      click_on('Make a new stage')
      click_on('Alma\'s Jammy Experimental Stage')
      click_on('Edit stage')
      fill_in('name', :with => 'Blue Stage')
      click_on('Update')
      expect(page).to have_content('Blue Stage')
    end
  end
end
