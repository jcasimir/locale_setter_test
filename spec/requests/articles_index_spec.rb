require 'spec_helper'

describe "articles#index" do
  before(:all) do
    load "#{Rails.root}/db/seeds.rb" 
  end

  it "uses the default locale title by default" do
    visit articles_path
    page.should have_content("Hello, World!")
  end

  context "with a URL parameter locale" do
    it "uses the specified locale title" do
      visit articles_path(:locale => "arr")
      page.should have_content("A'hoy, mate!")
    end
  end

  context "with a current_user who specifies a locale" do
    it "uses the specified locale title" do
      visit articles_path(:user => true)
      page.should have_content("Hello, User!")
    end
  end
  
  context "with only HTTP_ACCEPT_LANGUAGE specified" do
    Capybara.register_driver :rack_test_accept_language do |app|
      Capybara::RackTest::Driver.new(app, :headers => { 'HTTP_ACCEPT_LANGUAGE' => 'http' })
    end

    it "uses the specified locale title" do
      Capybara.current_driver = :rack_test_accept_language
      visit articles_path
      page.should have_content("Hello, HTTP!")
      Capybara.use_default_driver
    end
  end
end