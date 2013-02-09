require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
  	get '/'
  	response.body.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
  	get '/contact'
  	response.body.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
  	get '/about'
  	response.body.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
  	get '/help'
  	response.body.should have_selector('title', :content => "Help")
  end

  it "should have a signup page at '/signup'" do
  	get '/signup'
  	response.body.should have_selector('title', :content => "Sign up")
  end

  it "should have the right links on the layout" do
  	visit root_path
  	click_link "About"
  	response.body.should have_selector('title', :content => "About")
  	click_link "Help"
  	response.body.should have_selector('title', :content => "Help")
  	click_link "Contact"
  	response.body.should have_selector('title', :content => "Contact")
  	click_link "Home"
  	response.body.should have_selector('title', :content => "Home")
  	click_link "Sign up now!"
  	response.body.should have_selector('title', :content => "Sign up")
  end


end
