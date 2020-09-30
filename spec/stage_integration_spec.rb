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